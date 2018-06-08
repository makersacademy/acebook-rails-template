FactoryBot.define do
  factory :user do
    email 'example@hotmail.com'
    first_name 'Clint'
    last_name 'Pondsworth'
    username 'GoldFish'
    password '123456'
  end
  factory :post do
    message 'Hello World!'
    user { User.first || association(:user) }
  end
end
