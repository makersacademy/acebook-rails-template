# frozen_string_literal: true

class Post < ApplicationRecord
  validates :post_type, inclusion: { in: %w[wall public] }
end
