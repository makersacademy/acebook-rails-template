FactoryBot.define do
  sequence :email do |n|
    "alicebobson#{n}@gmail.com"
  end

  factory :user do
    name { 'Alice Bobson' }
    email
    password { 'password123' }
  end
end
