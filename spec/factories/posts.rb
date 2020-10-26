require 'faker'

FactoryBot.define do
  factory :post do 
    message { 'Hello world' }
    id { Faker::Number.unique.number }
    user_id { 5 }
  end
end