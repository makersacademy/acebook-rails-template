FactoryBot.define do
  factory :user do
    email { "matt@com" }
    password  { "password" }
    # admin { false }
  end
end