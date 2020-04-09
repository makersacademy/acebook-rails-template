class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  # validates :password, :presence => true #password_confirmation attr
  validates_length_of :password, :in => 6..10, :on => :create
end
