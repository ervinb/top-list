require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password "123456pass"
    password_confirmation "123456pass"
  end
end
