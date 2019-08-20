class Post < ApplicationRecord
  belongs_to :user
  has_one :target_user
end
