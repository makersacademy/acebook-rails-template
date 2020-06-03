class User < ApplicationRecord
  validates_presence_of :fname, :lname, :email, :password
end
