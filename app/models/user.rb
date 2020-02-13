class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_with EmailDomainValidator
end
