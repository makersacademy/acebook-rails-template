class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_with EmailDomainValidator
  validates :password, length: { within: 6..10 }
end
