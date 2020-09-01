class UsersPost < ApplicationRecord
  self.primary_key = 'post_id'
  belongs_to :user
  belongs_to :post
end
