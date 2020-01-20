class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  # def self.line_break(message)
  #   message.gsub(/\r\n/, "<br>").html_safe
  # end

  def not_recent?
    (Time.now - self.created_at) >= 600
  end
end
