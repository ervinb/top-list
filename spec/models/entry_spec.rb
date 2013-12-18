require 'spec_helper'

describe Entry do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:poll_id).of_type(:integer) }
  it { should have_db_column(:score_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should belong_to(:poll) }
  it { should have_many(:scores) }

  describe ".total_score" do

    before :each do
      @entry = FactoryGirl.create(:entry)
      @score_1 = FactoryGirl.create(:score, :entry => @entry )
      @score_2 = FactoryGirl.create(:score, :entry => @entry )
    end

    it "should return the total score of the entry" do
      @entry.total_score.should == 20 
    end

  end

end
