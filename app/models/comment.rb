# frozen_string_literal: true

# Comments class, which belongs to post.
class Comment < ApplicationRecord
  belongs_to :post
end
