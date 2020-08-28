class Post < ApplicationRecord
  has_one :user
  belongs_to :users_post
end
