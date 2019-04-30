class Post < ApplicationRecord

  def self.format_time(time)
    time.localtime.strftime('%d/%m/%Y %H:%M')
  end
end
