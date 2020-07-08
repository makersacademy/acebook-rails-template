# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :message, length: {minimum: 1}, on: :create
  
  def editable?
    Time.now - self.created_at < 5.seconds
  end

end
