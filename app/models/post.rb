class Post < ApplicationRecord
	 has_one_attached :image
<<<<<<< HEAD
	 scope :order_by_created_at, -> { order("created_at DESC") }

	 def increment_likes(by_value)
 		 self.likes += by_value
 	end
	
=======
>>>>>>> chore: review duplicated code and linting
end
