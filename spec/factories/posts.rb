# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do
    trait :new do
      message { 'Hello world' }
      id { 5 }
      user_id { 5 }
    end

    trait :old do
      message { 'Hello world' }
      id { Faker::Number.unique.number }
      user_id { 5 }
      created_at { Time.new(2020, 10, 26, 11, 21, 34) }
    end
  end
end
