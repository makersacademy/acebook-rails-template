FactoryBot.define do
  factory :comment do
    post { nil }
    user { nil }
  end
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
