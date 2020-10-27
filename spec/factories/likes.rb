# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    id { Faker::Number.unique.number(digits: 3) }
    post_id { 5 }
    user_id { 5 }
  end
end
