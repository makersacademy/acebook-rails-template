# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    commenter { 'MyString' }
    body { 'MyText' }
    post { nil }
  end
end
