require 'spec_helper'

describe RecordsController do

    include Devise::TestHelpers

    let(:user) { mock_model(User) }
    let(:poll) { mock_model(Poll, :id => 1, :name => "nPoll", :user => user) }
    let(:record) { mock_model(Record, :name => 'book1') }

    before :each do
      controller.should_receive(:authenticate_user!) {true}
    end

    describe "POST :create" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
        poll.stub_chain(:records, :build).with(record.name) {record}
      end

      context "with valid attributes" do

        before :each do
          poll.should_receive(:save) { true }
        end

        it "redirects to the poll :show page" do
          post :create, poll_id: poll.id
        end

      end

      context "with invalid parameters" do
        before :each do
          poll.should_receive(:save) { false }
        end

        it "redirects to the poll's :edit pageg" do
          post :create, poll_id: poll.id
          response.should render_template poll_edit_path(poll)
        end
      end

    end

end
