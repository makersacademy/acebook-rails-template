class User < ApplicationRecord

  validates :full_name, presence: true
  validates :handle, presence: true
  validates :email, presence: true
  validates :password, presence: true

end
