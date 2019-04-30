FactoryBot.define do
  factory :comment do
    post { nil }
    user { nil }
    body { "MyText" }
  end

  factory :like do
    liker { 1 }
    post { nil }
  end

  factory :user do
    email { "matt@com" }
    password  { "password" }
  end
end
