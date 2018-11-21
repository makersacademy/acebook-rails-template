FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user
    post
  end
end
