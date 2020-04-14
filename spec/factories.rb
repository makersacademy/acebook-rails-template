FactoryBot.define do
  factory :user do
    id { 1 }
    email { "fake@email.com" }
    password { "password" }
  end
end
