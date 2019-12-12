class Post < ApplicationRecord
  # before_action :authenticate_user!
  acts_as_votable
  belongs_to :user 
  has_many :comments

  def parse_date()
    day = Date.new(self.created_at.wday).strftime("%a")
    time_array = (self.created_at.to_s.split(" ")[1]).split(":")
    time_string = "#{time_array[0]}:#{time_array[1]}"
    date_string = "#{day} at #{time_string}"
  end
  
end
