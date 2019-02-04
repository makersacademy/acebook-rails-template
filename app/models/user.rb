# frozen_string_literal: true

<<<<<<< HEAD
class User < ApplicationRecord

  has_many :posts
  
=======
require 'pry'
class User < ApplicationRecord
>>>>>>> 87748b41687fa4899d40807cf6788e44ec26b571
  has_secure_password

  validates :username, presence: true

  validates :email, presence: { message: ': Email cannot be blank' },
                    uniqueness: { message: ': Email is not unique' }

  validates :password, presence: true,
                       length: { minimum: 5 }
end
