class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  def avatar_thumbnail
    avatar.variant(resize: "100x100!").processed
  end

  def avatar_profile
    avatar.variant(resize: "350x525!").processed
  end
end
