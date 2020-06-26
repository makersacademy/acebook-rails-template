class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :first_name, uniqueness: true, if: -> { self.first_name.present? }
  validates :last_name, presence: true
  validates :last_name, uniqueness: true, if: -> { self.last_name.present? }
  has_many :posts
end
