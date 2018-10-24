# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@mail.co' }
    password { 'password' }
    id { 1 }
  end
end
