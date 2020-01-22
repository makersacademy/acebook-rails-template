class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates :password, :length => { :within => 6..10 }
  
  has_secure_password

  has_one :wall
end
