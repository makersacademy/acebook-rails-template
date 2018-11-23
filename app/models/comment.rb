# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  include Commentable
  belongs_to :commentable, polymorphic: true
end
