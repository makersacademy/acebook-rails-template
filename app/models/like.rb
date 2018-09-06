class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  validates :user_name, uniqueness: {scope: :post_id}
end
