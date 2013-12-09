require 'spec_helper'

describe Score do
  it { should have_db_column(:record_id).of_type(:integer) }
  it { should have_db_column(:score).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
