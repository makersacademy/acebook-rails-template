# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  # belongs_to :user
  validates :body, presence: true
  validates :commenter, presence: true
end
