# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
end
