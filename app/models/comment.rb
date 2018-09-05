class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  delegate :first_name, to: :user, prefix: true
end
