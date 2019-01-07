FactoryBot.define do
  factory :post do
    user_id { 1 }
    message { "hello, world!"}
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
  factory :comment do
    post { nil }
    user { nil }
    message{ "A comment!" }
  end
end
