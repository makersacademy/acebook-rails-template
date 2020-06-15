class User < ApplicationRecord
  has_secure_password
  

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ # regex for matching email
  validates :email, uniqueness: true
  validates :password, :length =>{
    :minimum => 6,
    :maximum => 10,
  }, :on => :create

  
  

end
