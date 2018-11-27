require 'time'

class Post < ApplicationRecord
  require 'sanitize'
  before_save :sanitize_message
  belongs_to :user

  def sanitize_message
    Sanitize.fragment(message, Sanitize::Config::RELAXED)
  end
end
