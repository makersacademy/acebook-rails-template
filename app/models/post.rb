class Post < ApplicationRecord
  belongs_to :user

  def recent?
    (Time.now - self.created_at) < 600
  end
end
