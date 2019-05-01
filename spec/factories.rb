# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'riya@test.com' }
    password { '123456' }
    id { 2 }
  end
end
