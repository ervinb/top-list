require 'factory_girl'

FactoryGirl.define do

  factory :record do
    sequence(:name) { |n| "Entry_#{n}" }
    poll
  end

end
