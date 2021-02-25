class Post < ApplicationRecord
  validates_presence_of :message, :message => "can't be empty"
end
