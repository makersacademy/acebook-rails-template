class User < ApplicationRecord

    has_many :posts, dependent: :destroy
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :likes, dependent: :destroy

    validates :name, presence: true
    EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true

    before_save { self.email = email.downcase }

    has_secure_password
    validates :password, length: { minimum: 6, maximum: 10 }
end
