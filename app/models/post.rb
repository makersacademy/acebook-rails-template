# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def not_editable?
   (Time.now - self.created_at) > 600
  end
  
end
