class User < ApplicationRecord
  validates_presence_of :name, :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_email_format_of :email
  validates_uniqueness_of :email
end
#
