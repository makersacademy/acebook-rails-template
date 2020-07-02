class Post < ApplicationRecord

  def editable?
    Time.now - self.created_at < 10.seconds
  end


end
