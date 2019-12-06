class Post < ApplicationRecord
  belongs_to :user

  def self.sortedbymostrecent
    self.all.sort_by { |post| post[:created_at] }.reverse
  end

  def linebreak
    self.message.split("\r\n")
  end

end
