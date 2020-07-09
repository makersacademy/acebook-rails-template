class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true, allow_blank: false

  def editable?
    Time.now - self.updated_at < 10.seconds
  end
end

