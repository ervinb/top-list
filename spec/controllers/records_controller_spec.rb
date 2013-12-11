require 'spec_helper'

describe RecordsController do

    include Devise::TestHelpers

    let(:user) { mock_model(User) }
    let(:poll) { mock_model(Poll, :id => 1, :name => "nPoll", :user => user) }
    let(:polls) { [] }
    let(:record) { mock_model(Record, :name => 'book1') }

    before :each do
      controller.should_receive(:authenticate_user!) {true}
    end

    describe "POST :create" do

      before :each do
        Poll.should_receive(:find).with(poll.id.to_s) { poll }
        controller.stub_chain(:poll, :records, :build).with(poll.name) { poll }
      end

      context "with valid attributes" do

        before :each do
          poll.should_receive(:save) { true }
        end

        it "redirects to the poll :show page" do
          post :create, record: record.to_json, :format => :json
        end

      end

    end

end
