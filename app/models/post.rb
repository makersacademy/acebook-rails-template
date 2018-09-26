class Post < ApplicationRecord

  def self.convert_time(post)
    original_date_format = post.created_at
    # original_date_format_as_integer = original_date_format.to_i 
    original_date_format.strftime("%B %e, %Y at %I:%M %p")
  end   



end
