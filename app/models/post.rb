class Post < ApplicationRecord

  def formatted_time
    self.created_at.strftime("%-dth %b,%l:%M%P")
  end
end
