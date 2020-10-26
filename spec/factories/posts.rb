require 'faker'

FactoryBot.define do
  factory :post do 
    message { 'Hello world' }
    id  { 5 }
    user_id { 5 }
  end
end