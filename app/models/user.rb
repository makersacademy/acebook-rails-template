require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name

  validates :email, format: { with: /@/, on: :create }, uniqueness: true

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..10}

  has_one :wall
end
