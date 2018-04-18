# frozen_string_literal: true

require 'open-uri'

class News < ApplicationRecord
  def initialize
    @title_feed = []
  end

  def extract
    @data = open('https://newsapi.org/v2/everything?q=darts&sortBy=publishedAt&apiKey=0f0ca44ff1624746a29cae871a4ad1a5')
  end

  def parse
    JSON.parse(@data).read
  end

  private

  def extract_title(data_source)
    data_source[:articles].each do |a|
      title_feed.push(a[:title])
    end
  end
end
