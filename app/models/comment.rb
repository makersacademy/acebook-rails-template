class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comment, presence: true, length: { maximum: 255 }

  def editable?
    DateTime.now < (self.created_at + 10.minutes)
  end
  
end
