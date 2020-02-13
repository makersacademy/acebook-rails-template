class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_with EmailValidator
  validates :password, length: { within: 6..10 }

  after_validation(on: :create) do
    self.password = BCrypt::Password.create(password)
  end
end
