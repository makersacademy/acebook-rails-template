FactoryBot.define do
  factory :comment do
    comment { Faker::HarryPotter.spell }
    association :user, factory: :user
    association :post, factory: :post
  end
end
