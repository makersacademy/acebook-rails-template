class Post < ApplicationRecord
  belongs_to :user
  belongs_to :wall

  def lines
    puts message
    message.split( "\r\n" )
  end

end
