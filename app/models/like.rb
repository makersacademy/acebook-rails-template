class Like < ApplicationRecord
  belongs_to :post, polymorphic: true, optional: true
end
