FactoryBot.define do
  factory :comment do
    user_id { 1 }
    post_id { 1 }
    message { "Nice post." }
  end
end
