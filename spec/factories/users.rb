FactoryBot.define do
  factory :user, class: User do
    name { "Test Person" }
    email { "test@testing.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
