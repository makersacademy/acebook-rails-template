# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def not_editable?
   if (Time.now - self.created_at) > 600
   redirect_to posts_url
  end
end
  
end
