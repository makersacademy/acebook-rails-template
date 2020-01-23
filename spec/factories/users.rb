FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Example#{n}" }
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { "hey12345" }
  end
end
