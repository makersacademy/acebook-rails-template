class User < ApplicationRecord
  acts_as_token_authenticatable
  attr_accessor :first_name, :surname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :password, length: {maximum:10}
  has_many :posts

  def reset_authentication_token!
    authentication_token = nil
    save # automatically generates a new authentication token
    authentication_token 
  end

  def reset_authentication_token!
    update_column(:authentication_token, Devise.friendly_token)
  end
end
