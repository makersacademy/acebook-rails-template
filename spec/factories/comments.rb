FactoryBot.define do
  factory :comment do
    user { nil }
    body { "MyText" }
    post { nil }
  end
end
