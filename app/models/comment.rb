class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likeable

  def less_than_ten_mins_ago
    (Time.now - created_at) / 60 <= 10
  end
end
