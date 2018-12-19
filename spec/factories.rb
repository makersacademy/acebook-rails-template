FactoryBot.define do
  factory :user do
    id { 1 }
    first_name { "John" }
    last_name  { "Doe" }
    email { "myarse@yourfuckingface.com" }
    password { "password" }
  end
end
