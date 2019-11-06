FactoryBot.define do
  
  factory :user do
    first_name {"Test"}
    last_name {"Test"}
    email {"test@test.com"}
    password {"123456"}
    id {"1"}
  end
end