module ApplicationHelper

  def convert_time(date_time)
    date_time.strftime("%B %e, %Y at %I:%M %p")
  end

end
