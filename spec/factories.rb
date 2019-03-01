FactoryBot.define do
  factory :user do
    email { "1234@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end