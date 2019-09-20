FactoryBot.define do
  factory :post do
    user
    wall
    message { 'some random message' }
  end
end
