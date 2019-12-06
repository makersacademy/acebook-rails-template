class Post < ApplicationRecord
  belongs_to :user

  def self.sortedbymostrecent
    self.all.sort_by { |sorted| sorted[:created_at] }.reverse!
  end

  def linebreak
    self.message.split("\r\n")
  end

  def edit(edited_message)
    self.message = edited_message
  end

end
