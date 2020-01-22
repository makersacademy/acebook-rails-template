class Post < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User", optional: true
end
