class User < ApplicationRecord
  include Clearance::User
  has_many :posts, dependent: :destroy
  has_one :wall
end
