class User < ApplicationRecord
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..10,
   wrong_length: "Your password is not asian enough, 6 to 10 characters.."}
  validates :ethnicity, presence: true
end
