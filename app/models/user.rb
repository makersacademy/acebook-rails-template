class User < ApplicationRecord
  puts 'set up'
  has_many :posts, dependent: :restrict_with_exception
  puts 'validate password'
  validates :password, length: {
    minimum: 6,
    maximum: 10,
    too_short: 'The password must have at least 6 characters',
    too_long: 'The password must have no more than 10 characters'
  }
  puts 'validate uniqueness'
  validates :email, uniqueness: {
    message: 'Email already taken, please choose another'
  }
  puts 'validate with emailvalidator'
  validates_with EmailValidator
  puts 'encrypt password'
  after_validation(on: :create) do
    self.password = BCrypt::Password.create(password)
  end
end
