# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :message, presence: true, allow_blank: false
  
  def editable?
    Time.now - self.created_at < 600.seconds
  end

end
