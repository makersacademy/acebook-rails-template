class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_one :photo, dependent: :destroy
  belongs_to :user, optional: true

  def get_photo(post_id)
    Photo.find_by(post_id: post_id)
  end
end
