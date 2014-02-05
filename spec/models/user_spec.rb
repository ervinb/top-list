require 'spec_helper'

describe User do

  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:password).of_type(:string) }
  it { should have_db_column(:poll_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:sign_in_count).of_type(:integer) }
  it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:current_sign_in_ip).of_type(:string) }
  it { should have_db_column(:last_sign_in_ip).of_type(:string) }

  it { should validate_uniqueness_of(:email) }

  it { should have_many(:polls) }

  describe ".poll_owner" do

    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "current user IS the owner" do

      before :each do
        @poll = FactoryGirl.create(:poll, :user => @user)
      end

      it "returns true when current user is the owner of the poll" do
        @user.poll_owner(@poll.id).should be_true
      end

    end

    context "current user is NOT the owner" do

      before :each do
        @poll = FactoryGirl.create(:poll)
      end

      it "returns true when current user is the owner of the poll" do
        @user.poll_owner(@poll.id).should be_false
      end

    end

  end

end
