# frozen_string_literal: true

# This model manages relationships with both the Post and the User
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
