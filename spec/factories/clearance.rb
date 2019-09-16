FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password { "password" }
  end

  factory :post do
    user
    message {"random message"}
  end
end
