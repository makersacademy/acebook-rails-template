class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def line_break
    self.message = message.gsub(/\n/, "<br>").html_safe
    self.message = message.gsub(/\r/, "").html_safe
    
  end

  def not_recent?
    (Time.now - self.created_at) >= 600
  end
end
