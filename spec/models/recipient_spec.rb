require 'spec_helper'

describe Recipient do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:poll_id).of_type(:integer) }
  it { should have_db_column(:token).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should belong_to(:poll) }

  describe ".has_voted" do

    before :each do
      @poll = FactoryGirl.create(:poll)
      @entry = FactoryGirl.create(:entry, :poll => @poll)
      @recipient = FactoryGirl.create(:recipient)
    end

    it "returns true if the recipient has voted" do
      @poll.build_scores([@entry.id], @recipient.token, nil)
      @recipient.has_voted(@poll.id).should be_true
    end
        
  end

end
