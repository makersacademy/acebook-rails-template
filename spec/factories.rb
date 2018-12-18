FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { "myarse@yourfuckingface.com" }
    password { "password" }
  end
end
