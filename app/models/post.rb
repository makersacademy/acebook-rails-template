class Post < ApplicationRecord
  def date
    created_at.strftime('%d %b %Y')
  end
end
