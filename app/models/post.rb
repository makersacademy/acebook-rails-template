class Post < ApplicationRecord

  def self.sortedbymostrecent
    self.all.sort_by { |sorted| sorted[:created_at] }.reverse!
  end

  def linebreak
    self.message.split("\r\n")
  end

end
