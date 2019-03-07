class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :photos, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_photo(user_id)
    @photo = Photo.find_by(user_id: user_id)
    if @photo.nil?
      'defaultprofile.jpg'
    else
      @photo.image.url
    end
  end

end
