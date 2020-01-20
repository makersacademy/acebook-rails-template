class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def recent?
    (Time.now - self.created_at) < 600
  end
end
