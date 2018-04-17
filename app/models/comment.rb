class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :post
  belongs_to :user

  def author
    User.find(self.user_id.to_i).identifier
  end

end
