require 'factory_girl'

FactoryGirl.define do

  factory :poll do
    name "nPoll"
    user
    locked false
  end

end
