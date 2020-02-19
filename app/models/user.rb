class User < ApplicationRecord
  has_secure_password
  
  validates :email, format: { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :email, uniqueness: true
  validates :password, :length => {
    :minimum => 6,
    :maximum => 10,
  }, :on => :create

  has_many :posts, dependent: :destroy
  
end
