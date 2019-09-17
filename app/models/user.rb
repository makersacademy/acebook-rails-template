# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
