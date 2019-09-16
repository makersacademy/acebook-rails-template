FactoryBot.define do
  factory :comment do
    user_id { "" }
    body { "MyString" }
    post { nil }
  end
end
