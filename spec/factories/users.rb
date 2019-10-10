FactoryBot.define do
  factory :user do
    email { "dan2@dan.com"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end
