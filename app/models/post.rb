class Post < ApplicationRecord

  def convert_time
    created_at.strftime("%B %e, %Y at %I:%M %p")
  end

end
