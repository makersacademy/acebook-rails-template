# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  def editable?
    Time.now - self.created_at < 5.seconds
  end

end
