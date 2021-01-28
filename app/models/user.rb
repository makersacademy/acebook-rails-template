require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  # attribute :password_digest
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, :presence => true,
                   :uniqueness => {:case_sensitive => true},
                   :length => {:minimum => 6}

  def to_param
    id
    name
  end

end
