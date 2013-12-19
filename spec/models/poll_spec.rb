require 'spec_helper'

describe Poll do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should belong_to(:user) }
  it { should have_many(:entries) }

  describe ".build_scores" do
    before :each do
      @poll = FactoryGirl.create(:poll)

      @entry_1 = FactoryGirl.create(:entry, :poll => @poll)
      @entry_2 = FactoryGirl.create(:entry, :poll => @poll)

      @entry_ids = [@entry_1.id.to_s, @entry_2.id.to_s]
    end

    it "saves the entry score" do
      expect {
        @poll.build_scores @entry_ids
      }.to change(Score, :count).by(2)

      @entry_1.scores.first.score.should == 0
      @entry_2.scores.first.score.should == 1

    end

  end
end
