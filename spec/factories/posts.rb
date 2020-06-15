FactoryBot.define do
  factory :post do
    association :user, factory: :user
    message { Faker::HarryPotter.quote }
  end
end
