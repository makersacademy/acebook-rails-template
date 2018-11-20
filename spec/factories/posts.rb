FactoryBot.define do
  factory :post do
    message { 'my first post' }
    user
  end
end
