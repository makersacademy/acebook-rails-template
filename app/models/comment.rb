class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :message, presence: true, allow_blank: false

  def self.recent?(comment)
    (Time.now - comment.created_at) < 600
  end
end
