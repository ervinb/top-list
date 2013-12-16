require 'spec_helper'

describe Entry do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:poll_id).of_type(:integer) }
  it { should have_db_column(:score_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should belong_to(:poll) }
  it { should have_many(:scores) }
end
