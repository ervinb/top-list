require 'spec_helper'

describe PollsController do

  include Devise::TestHelpers

  let(:user) { mock_model(User) }

  let(:poll) { mock_model(Poll, :name => "nPoll", :user => user, :locked => false) }
  let(:polls) { [] }

  let(:entry) { mock_model(Entry) }
  let(:entry_ids) { [entry.id.to_s] }

  let(:recipient) { mock_model(Recipient, :poll => poll) }
  let(:recipients) { [] }

  context "user not authenticated" do

    describe "GET :index" do
      it "renders the :index page" do
        get :index
        response.should render_template "index"
      end
    end

    describe "GET :show" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
      end

      it "renders the :show page" do
        get :show, :id => poll.id

        response.should render_template "show"
      end

    end

  end

  context "user authenticated" do

    before :each do
      controller.should_receive(:authenticate_user!) {true}
      controller.stub(:current_user) { user }
    end

    describe 'GET :new' do
      it "creates a new Poll instance" do
        get :new
        response.should render_template "new"
      end
    end

    describe "POST :create" do

      before :each do
        Poll.should_receive(:new).with("name" => "nPoll") {poll}
        poll.should_receive(:user=).with(user)
      end

      context "with valid attributes" do

        before :each do
          poll.should_receive(:save) {  true }
        end

        it "redirects to the poll's :show page" do
          post :create, :poll => {:name => poll.name}
          response.should redirect_to poll_path(poll)
        end

        it "sets the flash message" do
          post :create, :poll => {:name => poll.name}
          flash[:notice].should == "Poll was successfully created."
        end

      end

      context "with invalid attributes" do

        before :each do
          poll.should_receive(:save) { false }
        end

        it "renders the :new page" do
          post :create, :poll => {:name => poll.name}
          response.should render_template "new"
        end

      end

    end

    describe "GET :edit" do

      before :each do
        Poll.should_receive(:find) { poll }
      end

      context "poll is not permanently locked" do

        before :each do
          poll.should_receive(:permanent_lock) { false }
        end

        it "renders the :edit page" do
          get :edit, id: poll.id
          response.should render_template "edit"
        end

      end

      context "poll is permanently locked" do

        before :each do
          poll.should_receive(:permanent_lock) { true }
        end

        it "renders the show page with a notice" do
          get :edit, id: poll.id
          response.should redirect_to poll_path(poll)
          flash[:notice].should == "The poll is permanently locked!"
        end

      end

    end

    describe "PUT :update" do

      context "updates the poll" do

        before :each do
          Poll.should_receive(:find).with(poll.id.to_s) { poll }
          poll.should_receive(:update) { true }
        end

        it "updates the poll" do
          put :update, :id => poll.id, :poll => { :name => "Poll" }
          response.should redirect_to poll_path poll
        end

      end

      context "doesn't update the poll" do

        before :each do
          Poll.should_receive(:find).with(poll.id.to_s) { poll }
          poll.should_receive(:update) { false }
        end

        it "updates the poll" do
          put :update, :id => poll.id, :poll => { :name => "Poll" }
          response.should render_template "edit"
        end

      end

    end

    describe "POST :destroy" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
      end

      it "redirects to the polls list" do
        delete :destroy, :id => poll.id
        response.should redirect_to polls_path
      end

    end

    describe "POST :lockdown" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
      end

      context "locks the poll" do
        before :each do
          poll.should_receive(:lock) { true }
        end

        it "redirects to poll's :show page" do
          post :lockdown, :id => poll.id
          response.should redirect_to poll_path(poll)
          flash[:notice].should == "Poll locked!"
        end

      end

      context "unlock the poll" do

        before :each do
          poll.should_receive(:lock) { false }
        end

        it "redirects to the poll's page" do
          post :lockdown, :id => poll.id
          response.should redirect_to edit_poll_path(poll)
          flash[:notice].should == "Poll unlocked!"
        end

      end

    end

    describe "GET :invitations" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
        poll.stub_chain(:recipients, :build) { recipients }
      end

      it "redirects the invitation form" do
        get :invitations, :id => poll.id
        response.should render_template "invitations"
      end

    end

    describe "POST :send_invitations" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
        poll.should_receive(:invite_recipients)
      end

      context "sends the invites"
        before :each do
          poll.should_receive(:update) { true }
        end

        it "sends the invites and redirect to poll's :show" do
          post :send_invitations, :id => poll.id, :poll => { :name => poll.name }, :recipients => recipients
          response.should redirect_to poll_path(poll)
        end

      end

      context "doesn't send the invites" do

        before :each do
          Poll.should_receive(:find).with(poll.id.to_s) { poll }
          poll.should_receive(:update) { false }
        end

        it "sends the invites and redirect to poll's :show" do
          post :send_invitations, :id => poll.id, :poll => { :name => poll.name }, :recipients => recipients
          response.should render_template "invitations"
        end

      end

  end


  describe "POST :vote" do

    before :each do
      Poll.should_receive(:find).with(poll.id.to_s) { poll }
      poll.should_receive(:build_scores).with(entry_ids, "$token$", nil) # nil is the current_user in the controller
    end

    it "processes the vote and redirects to the poll's :show page" do
      post :vote, :id => poll.id, :token => "$token$", :entries => entry_ids, :format => :json
      response.body.should == { path: poll_path(poll) }.to_json
    end

  end

end
