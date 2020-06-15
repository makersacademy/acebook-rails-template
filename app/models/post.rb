class Post < ApplicationRecord
  belongs_to :user, required: false
end
