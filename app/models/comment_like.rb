# frozen_string_literal: true

class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
