class User < ApplicationRecord
  include Clearance::User
  has_many :posts, dependent :destroy
end
