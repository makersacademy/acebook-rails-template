class Post < ApplicationRecord
    def get_time
        self.created_at.strftime("%I:%M %p, %d of %B")
    end
end
