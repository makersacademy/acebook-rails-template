class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :albums
  has_one_attached :profile_picture
  has_many :comments
  acts_as_voter
end
