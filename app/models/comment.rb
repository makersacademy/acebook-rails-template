class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :delete_all
  validates :comment, presence: true, length: { maximum: 255 }

  def editable?
    DateTime.now < (self.created_at + 10.minutes)
  end

end
