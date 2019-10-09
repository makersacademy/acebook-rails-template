class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :recoverable,
  devise :database_authenticatable, :registerable,
  :validatable, :timeoutable
end
# :confirmable
