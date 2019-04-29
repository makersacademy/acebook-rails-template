FactoryBot.define do
  factory :like do
    liker { 1 }
    post { nil }
  end

  factory :user do
    email { "matt@com" }
    password  { "password" }
  end
end