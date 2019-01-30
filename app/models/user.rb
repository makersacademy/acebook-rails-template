# frozen_string_literal: true

class User < ApplicationRecord

  validates :username, presence: true

  validates :email, presence: { message: ': Email is not unique' }

  validates :password, presence: true,
            length: { minimum: 5 }

end
