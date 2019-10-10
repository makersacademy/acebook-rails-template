FactoryBot.define do
  factory :post do
    message { "MyString" }
    user_id { User.all.first["id"] }
  end
end
