#user_factory.rb

require "ffaker"

FactoryGirl.define do
  factory :user do
    email FFaker::Internet.email
    password "password"

    trait :admin do
      admin true
    end
  end
end