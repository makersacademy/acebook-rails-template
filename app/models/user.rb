class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: false, uniqueness: true
end
