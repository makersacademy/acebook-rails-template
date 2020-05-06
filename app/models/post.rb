class Post < ApplicationRecord

  def formatted_time
    time = Time.new
    time_formatted = time.strftime("%-dth %b,%l:%M%P")
    # self.created_at.strftime("%-dth %b,%l:%M%P")
    self.created_at.time_formatted
  end
end
