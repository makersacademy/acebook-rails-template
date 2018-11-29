FactoryBot.define do

  factory :user do
    id {"2"}
    name {'John'}
    email {'John@example.com'}
    password {'sosecure'}
    password_confirmation {'sosecure'}
  end

  factory :post do
    wall_id {"1"}
    user_id {"2"}
    message {"Hi there user 1"}
  end

end
