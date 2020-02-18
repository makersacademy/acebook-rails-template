class Profile < ApplicationRecord
  has_one :user
  has_many :posts
end
