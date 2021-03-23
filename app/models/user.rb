class User < ApplicationRecord
  # attr_reader :name, :email

  validates :name, presence: true

end
