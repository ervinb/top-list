require 'factory_girl'

FactoryGirl.define do

  factory :recipient do
    sequence(:email) { |n| "rcpnt_#{n}@gmail.com" }
    token SecureRandom.hex(12)
    poll
  end

end
