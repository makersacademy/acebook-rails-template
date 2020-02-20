# frozen_string_literal: true

class Post < ApplicationRecord
  validates :type, inclusion: { in: %w(wall public) }
end
