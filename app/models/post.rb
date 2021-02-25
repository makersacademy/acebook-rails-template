class Post < ApplicationRecord
  validates_presence_of :message, :presence => {:message => 'no message'}
end
