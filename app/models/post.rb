class Post < ApplicationRecord
  belongs_to :users, optional: true
end
