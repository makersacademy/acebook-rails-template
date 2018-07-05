class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # The way to tell CarrierWave to associate the image
  # with a model is to use the mount_uploader method, 
  # which takes as arguments a symbol representing the
  # attribute and the class name of the generated uploader:
  mount_uploader :avatar, AvatarUploader
end
