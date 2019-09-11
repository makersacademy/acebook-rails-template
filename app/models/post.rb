class Post < ApplicationRecord
    def get_time
        p self.created_at.strftime("%I:%M %p, %d of %B")
    end

end
