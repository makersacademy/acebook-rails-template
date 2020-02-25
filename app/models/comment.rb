class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comment_time_stamp
    if self.created_at.strftime("%x") == Time.now.strftime("%x")
      return "Commented today at #{self.created_at.strftime("%H:%M")}"
    else
      "Commented on #{self.created_at.strftime("%A %d %b")} at #{self.created_at.strftime("%H:%M")}"
    end
  end

  def editable?
    self.created_at + 10.minutes < Time.now ? false : true
  end
end
