class Post < ApplicationRecord
  belongs_to :user
  def date
    created_at.strftime('%d %b %Y')
  end
end
