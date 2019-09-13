class Post < ApplicationRecord
  belongs_to :user

  def lines
    puts message
    message.split( "\r\n" )
  end

end
