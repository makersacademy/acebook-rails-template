# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  def editable?
    Time.now - self.created_at < 5.seconds
  end

end
