require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :quote do
    text "Something fired up to motivate people"
    author "Obama"
  end

  factory :habit do
    name "Brush teeth"
    frequency "monday, tuesday, wednesday"
    user
  end

  factory :daily_habit do
    habit
    user
  end
end
