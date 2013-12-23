require 'factory_girl'

FactoryGirl.define do

  factory :recipient do
    sequence(:email) { |n| "rcpnt_#{n}@gmail.com" }
    poll
  end

end
