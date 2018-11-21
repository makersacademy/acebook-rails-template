# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :post_likes, dependent: :delete_all

  def editable?
    DateTime.now < (self.created_at + 10.minutes)
  end

end
