class Comment < ApplicationRecord
    validates :comment, presence: true
    belongs_to :post
    belongs_to :user
    validates :user_id, presence: true
    validates :post_id, presence: true
    validates :content, presence: true
end
