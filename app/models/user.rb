class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :rememberable :recoverable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
