# frozen_string_literal: true

# defines posts
class Post < ApplicationRecord
  belongs_to :user
end
