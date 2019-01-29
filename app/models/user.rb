# frozen_string_literal: true

class User < ApplicationRecord

  validates :username, presence: true

  validates :email, presence: true,
            uniqueness: true

  validates :password, presence: true,
            length: { minimum: 6 }

end
