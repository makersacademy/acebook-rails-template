class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed
  end

  def avatar_profile
    avatar.variant(resize: "400x400!").processed
  end
end
