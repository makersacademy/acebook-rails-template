class User < ApplicationRecord
  include Clearance::User
  validates :username, uniqueness: true
  # validates :password, length: { minimum: 6, maximum: 20 }, on: :create
end
