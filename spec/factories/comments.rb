require 'faker'

FactoryBot.define do
  factory :comment do 
    comment { 'Love it!!' }
    id  { Faker::Number.unique.number(digits: 3) }
    user_id { 5 }
    post_id { 5 }
  end
end