class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :comments
  acts_as_voter
end
