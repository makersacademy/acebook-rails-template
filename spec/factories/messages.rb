FactoryBot.define do
  factory :message do
    id { 1 }
    body { "MyText" }
    conversation_id { 1 }
    user_id { nil }
    read { false }
    created_at { "2020-06-29 10:09:15.755385" }
    updated_at { "2020-06-29 10:09:15.755385" }
  end
end
