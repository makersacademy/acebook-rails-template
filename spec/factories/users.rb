FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { "hey12345" }
  end
end
