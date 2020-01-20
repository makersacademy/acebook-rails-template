class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.recent?(comment)
    (Time.now - comment.created_at) < 600
  end
end
