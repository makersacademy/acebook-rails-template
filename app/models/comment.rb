class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.under_ten_mins(post)
    (Time.now - post.created_at) < 600
  end
  
end
