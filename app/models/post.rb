class Post < ApplicationRecord
  def simplifydate
    return self.created_at.strftime('%d-%m-%Y')
  end

  def simplifytime
    return self.created_at.strftime('%H:%M')
  end
end
