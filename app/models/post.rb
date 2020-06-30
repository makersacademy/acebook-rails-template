class Post < ApplicationRecord
  def date
    time = self.created_at
    time(0..10)
  end
end
