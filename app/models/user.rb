class User < ApplicationRecord
  include SimpleDiscussion::ForumUser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :first_name, uniqueness: false, if: -> { self.first_name.present? }
  validates :last_name, presence: true
  validates :last_name, uniqueness: false, if: -> { self.last_name.present? }


  def name
    "#{first_name} #{last_name}"
  end

  
end
