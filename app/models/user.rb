class User < ApplicationRecord
    has_secure_password

    # attr_accessor :email, :password, :password_confirmation

    validates :email, presence: true, uniqueness: true
end
