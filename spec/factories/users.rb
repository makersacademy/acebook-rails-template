FactoryGirl.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
    password "password"
  end
end
