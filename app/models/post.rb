class Post < ApplicationRecord
  belongs_to :user

  def less_than_ten_mins_ago
    (Time.now - self.created_at)/60 <= 10
  end
end
