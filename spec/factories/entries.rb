require 'factory_girl'

FactoryGirl.define do

  factory :entry do
    sequence(:name) { |n| "Entry_#{n}" }
    poll
  end

end
