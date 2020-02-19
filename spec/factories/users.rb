FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@gmail.com" }
    sequence(:username) { |n| "BigUser#{n}" }
    password { "1234567" }
  end
end
