class Post < ApplicationRecord
  belongs_to :user

  def can_edit?
    time_diff = Time.now.utc - created_at
    (time_diff / 1.minute).round < 10
  end

  def lines
    message.split("\r\n")
  end
end
