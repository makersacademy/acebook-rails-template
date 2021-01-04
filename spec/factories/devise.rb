# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@user.com' }
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end
end
