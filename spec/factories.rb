FactoryBot.define do
  factory :timeline do
    user
    post
  end
  factory :post do
    user
    message { "hello, world!" }
  end
  factory :like do
    user
    post
  end
  factory :user do
    id { generate :user_id }
    first_name { "John" }
    last_name  { "Doe" }
    email { generate :email }
    password { "password" }
  end
  factory :comment do
    post
    user
    message { "A comment!" }
  end
  sequence :email do |n|
    "email#{n}@gmail.com"
  end
  sequence :user_id do |n|
    n
  end
end
