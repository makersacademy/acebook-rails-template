# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :user_id, :comment, :post_id
end
