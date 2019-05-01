# frozen_string_literal: true

class Post < ApplicationRecord
  def self.format_time(time)
    time.localtime.strftime('%d/%m/%Y %H:%M')
  end

  def allow_update?
    Time.now - self.created_at <= 600
  end

end
