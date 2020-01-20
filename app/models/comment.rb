class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def recent?
    (Time.now - self.created_at) < 600
  end
end
