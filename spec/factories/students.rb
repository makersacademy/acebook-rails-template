FactoryBot.define do
  factory :student do
    email { "test@example.com" }
    password { 'testing123' }
    password_confirmation { 'testing123' }
  end
end
