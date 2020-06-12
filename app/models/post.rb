# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, required: false
end
