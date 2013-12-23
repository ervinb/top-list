require 'spec_helper'

describe Poll do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_column(:locked).of_type(:boolean) }

  it { should belong_to(:user) }
  it { should have_many(:entries) }

  describe ".build_scores" do
        
    before :each do
        @user_1 = FactoryGirl.create(:user)
        @user_2 = FactoryGirl.create(:user)

        @poll = FactoryGirl.create(:poll, :user => @user_1)
        @recipient = FactoryGirl.create(:recipient)

        @entry_1 = FactoryGirl.create(:entry, :poll => @poll)
        @entry_2 = FactoryGirl.create(:entry, :poll => @poll)

        @entry_ids = [@entry_1.id.to_s, @entry_2.id.to_s]
    end

    context "current user is NOT owner" do

      it "saves the entry score" do
        expect {
          @poll.build_scores(@entry_ids, @recipient.token, @user_2)
        }.to change(Score, :count).by(2)

        @entry_1.scores.first.value.should == 0
        @entry_1.scores.first.token.should == @recipient.token

        @entry_2.scores.first.value.should == 1
        @entry_2.scores.first.token.should == @recipient.token

      end

    end

    context "current user is owner" do

      it "doesn't save the entry score" do
          @poll.build_scores(@entry_ids, @recipient.token, @user_1).should be_false
      end

    end

  end

  describe ".lock" do
    before :each do
      @poll = FactoryGirl.create(:poll)
    end

    it "locks the poll" do
      @poll.lock
      @poll.reload

      @poll.locked.should == true
    end

  end

  describe ".invite_recipients" do
    before :each do
      @poll = FactoryGirl.create(:poll)

      @recipient_1 = FactoryGirl.create(:recipient, :poll => @poll)
      @recipient_2 = FactoryGirl.create(:recipient, :poll => @poll)
      @recipients = [@recipient_1, @recipient_2]
    end

    it "invites the recipients" do
      @poll.invite_recipients

      @recipient_1.reload
      @recipient_2.reload

      @recipient_1.token.should_not == nil
      @recipient_2.token.should_not == nil
    end

  end
end
