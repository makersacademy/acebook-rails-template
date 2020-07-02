class Post < ApplicationRecord

  def editable?
    Time.now - self.created_at < 5.seconds
  end
end
