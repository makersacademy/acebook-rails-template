class Like < ApplicationRecord
  belongs_to :post, polymorphic: true, optional: true
  belongs_to :comment, polymorphic: true, optional: true
end
