class Post < ApplicationRecord
	 has_one_attached :image
	 has_many :comments
	 scope :order_by_created_at, -> { order("created_at DESC") }
	 validates :message, presence: true

	 def increment_likes(by_value)
 		 self.likes += by_value
 	end
	

end
