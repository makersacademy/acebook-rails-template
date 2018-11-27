require 'time'

class Post < ApplicationRecord
  require 'sanitize'
  include ActionView::Helpers::TextHelper

  before_save :sanitize_message, :add_newline
  belongs_to :user

  def sanitize_message
    Sanitize.fragment(message, Sanitize::Config::RELAXED)
  end

  def add_newline
    string = self.message
    html = simple_format(string)
    self.message = html
  end
end
