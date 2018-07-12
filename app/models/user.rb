class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :comments, dependent: :destroy # will destroy all comments that were associated with user if user is deleted
  mount_uploader :avatar, AvatarUploader
  
end
