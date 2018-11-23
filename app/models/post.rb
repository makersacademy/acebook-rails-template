require 'time'

class Post < ApplicationRecord
  belongs_to :user

  def self.dateformat(date)
    Time.parse(date).strftime('%-d %b %Y at %k:%M')
  end

end
