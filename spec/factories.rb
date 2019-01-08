FactoryBot.define do
  factory :timeline do
  end

  factory :post do
    user
    message { "hello, world!" }
  end

  factory :like do
    post { nil }
    user { nil }
  end

  factory :user do
    id { generate :user_id }
    first_name { "John" }
    last_name  { "Doe" }
    email { generate :email }
    password { "password" }
  end

  factory :comment do
    post { 1 }
    user { 1 }
    message { "A comment!" }
  end

  sequence :email do |n|
    "email#{n}@gmail.com"
  end

  sequence :user_id do |n|
    n
  end
end
