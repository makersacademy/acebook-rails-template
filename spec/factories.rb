FactoryBot.define do
  factory :user do
    email 'example@hotmail.com'
    password '123456'
  end
  factory :post do
    message 'Hello World!'
    user { User.first || association(:user) }
  end
end
