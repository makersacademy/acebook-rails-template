class Post < ApplicationRecord
    def posted_at
       self.created_at.strftime("%-d/%-m/%-y %H:%M")
    end




end
