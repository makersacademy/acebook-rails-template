# frozen_string_literal: true

class Profile < ApplicationRecord
  has_one :user
  has_many :posts
end
