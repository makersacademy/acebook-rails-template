# frozen_string_literal: true

require 'open-uri'

class News < ApplicationRecord
  def initialize
    @title_feed = []
  end

  def extract
    @data = open('https://newsapi.org/v2/everything?q=darts&sortBy=publishedAt&apiKey=0f0ca44ff1624746a29cae871a4ad1a5')
  end
end
