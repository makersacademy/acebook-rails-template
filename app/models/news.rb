require 'open-uri'

class News < ApplicationRecord

  def self.extract
    data = JSON.parse(open("https://newsapi.org/v2/everything?q=darts&sortBy=publishedAt&apiKey=0f0ca44ff1624746a29cae871a4ad1a5").read)
  end

end
