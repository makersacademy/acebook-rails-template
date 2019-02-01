class User < ApplicationRecord
  has_secure_password
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :birthday
  validates_presence_of :password
  validates_presence_of :gender
  validates_presence_of :email
  validates_presence_of :email
  validates_format_of :email, :with => /.*@.*/
  validates_uniqueness_of :email

end
