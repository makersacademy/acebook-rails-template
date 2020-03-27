class User < ApplicationRecord
  acts_as_voter
  validates :email, presence: true
  validates :password, presence: true, length: { within: 6..10 }
end
