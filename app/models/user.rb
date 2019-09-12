class User < ApplicationRecord
  include Clearance::User

  has_many :posts, dependent: :destroy

  # has_secure_password
end
