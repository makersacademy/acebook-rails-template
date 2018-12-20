FactoryBot.define do
  factory :like do
    post { nil }
    user { nil }
  end
  factory :user do
    id { 1 }
    first_name { "John" }
    last_name  { "Doe" }
    email { "jon@doe.com" }
    password { "password" }
  end
end
