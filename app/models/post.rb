class Post < ApplicationRecord
  # before_action :authenticate_user!
  acts_as_votable
  belongs_to :user
  has_many :comments

  def parse_date()
    date_array = self.created_at.to_s.split(' ')
    date = Date.parse(date_array[0]).strftime('%A')
    time_array = date_array[1].split(":")
    time_string = "#{time_array[0]}:#{time_array[1]}"
    date_string = "#{date} at #{time_string}"
  end
end 
