class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Othe rs available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
