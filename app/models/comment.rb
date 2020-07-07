class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def editable?
    Time.now - self.updated_at < 10.seconds
  end
end

