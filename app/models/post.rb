class Post < ApplicationRecord
	has_one_attached :image
	scope :order_by_created_at, -> { order("created_at DESC") }
end
