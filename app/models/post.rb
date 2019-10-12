class Post < ApplicationRecord
  belongs_to :user

  def time_stamp
    if self.created_at.strftime("%x") == Time.now.strftime("%x")
      return "Posted today at #{self.created_at.strftime("%H:%M")}"
    else "Posted on #{self.created_at.strftime("%A %d %b")} at #{self.created_at.strftime("%H:%M")}"
    end
  end

  def editable?
    self.created_at + 10.minutes < Time.now ? false : true
  end

end
