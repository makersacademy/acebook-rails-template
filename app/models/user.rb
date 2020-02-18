class User < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception
  validates :password, length: {
    minimum: 6,
    maximum: 10,
    too_short: 'The password must have at least 6 characters',
    too_long: 'The password must have no more than 10 characters'
  }
  validates :email, uniqueness: {
    message: 'Email already taken, please choose another'
  }
  validates_with EmailValidator

  after_validation(on: :create) do
    self.password = BCrypt::Password.create(password)
  end
end
