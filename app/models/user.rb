# frozen_string_literal: true

class User < ApplicationRecord
  attr_reader :email
  has_secure_password
  # validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
