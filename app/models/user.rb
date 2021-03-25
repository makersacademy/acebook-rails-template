class User < ApplicationRecord

  validates :name, presence: true # turn off as per spec
  validates :email, presence: true # turn off as per spec
  validates :password, presence: true, length: { minimum: 6, maximum: 10}
end
