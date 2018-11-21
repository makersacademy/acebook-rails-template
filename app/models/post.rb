# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def editable?
    DateTime.now < (self.created_at + 10.minutes)
  end

end
