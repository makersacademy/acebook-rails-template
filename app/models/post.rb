class Post < ApplicationRecord
    # belongs_to :user

    def get_time
        self.created_at.strftime("%I:%M %p, %d of %B")
    end

end

