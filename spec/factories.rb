# frozen_string_literal: true

FactoryBot.define do
  factory :image_like do
  end
  factory :user do
    email { 'factory@mail.co' }
    password { 'password' }
  end
end
