FactoryBot.define do
  factory :post do
    user_id { 1 }
    recipient_id { 3 }
    message { "Hello, World!" }
  end
end
