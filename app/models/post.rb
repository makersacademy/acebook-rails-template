class Post < ApplicationRecord
  belongs_to :user
  def simplifydate(date = self.created_at)
    return date.strftime('%d-%m-%Y')
  end

  def simplifytime(time = self.created_at)
    return time.strftime('%H:%M')
  end
end
