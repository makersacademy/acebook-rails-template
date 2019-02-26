class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :password, confirmation: true
end
