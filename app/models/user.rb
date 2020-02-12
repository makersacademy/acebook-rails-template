class User < ApplicationRecord
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, uniqueness: true
  validates :password, :length =>{
    :minimum => 6,
    :maximum => 10,
    :too_short => "password is too short, must be at least %{count} characters"
  }, :on => :create
  has_secure_password
end
