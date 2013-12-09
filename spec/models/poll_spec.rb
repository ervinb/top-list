require 'spec_helper'

describe Poll do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:record_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
