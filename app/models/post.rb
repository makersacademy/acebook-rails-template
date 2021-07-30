class Post < ApplicationRecord
	 has_one_attached :image
	 has_many :comments
	 has_many :likes, dependent: :destroy
	 scope :order_by_created_at, -> { order("created_at DESC") }
	 validates :message, presence: true
	 belongs_to :user
end
