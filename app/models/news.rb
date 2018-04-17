require 'open-uri'

class News < ApplicationRecord

  def initialize
    @titleFeed = []
  end

  def extract
    @data = JSON.parse(open("https://newsapi.org/v2/everything?q=darts&sortBy=publishedAt&apiKey=0f0ca44ff1624746a29cae871a4ad1a5"))
  end

  def parse
    JSON.parse(@data).read
  end

  private
  def extractTitle(dataSource)
    dataSource[:articles].each do |a|
      titleFeed.push(a[:title])
    end
  end

end
