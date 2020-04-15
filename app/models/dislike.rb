class Dislike < ApplicationRecord
  belongs_to :post
  belongs_to :timeline_post
  belongs_to :user
end
