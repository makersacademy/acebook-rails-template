class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  def self.sortedbymostrecent
    self.all.sort_by { |post| post[:created_at] }.reverse
  end

  def linebreak
    self.message.split("\r\n")
  end

  def update_valid?
    self.created_at + 600 > Time.now
  end

end
