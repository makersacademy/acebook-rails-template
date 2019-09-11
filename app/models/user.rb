class User < ApplicationRecord
  include Clearance::User

  has_many :posts

  # has_secure_password
end
