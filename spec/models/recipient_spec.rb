require 'spec_helper'

describe Recipient do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:poll_id).of_type(:integer) }
  it { should have_db_column(:token).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should belong_to(:poll) }
end
