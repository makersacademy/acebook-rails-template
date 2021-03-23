class User < ApplicationRecord
  # attr_reader :name, :email

  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true

end
