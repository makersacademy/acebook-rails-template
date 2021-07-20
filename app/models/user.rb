class User < ApplicationRecord

  validates :password, presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 }
end
