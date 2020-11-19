class Post < ApplicationRecord
    belongs_to :user

    def posted_at
       self.created_at.strftime("%-d/%-m/%-y %H:%M")
    end

    def formatted_message
      self.message.gsub(/\n/, '<br/>').html_safe
    end

    def owned_by(current_user_id)
      current_user_id == self.user_id
    end

end
