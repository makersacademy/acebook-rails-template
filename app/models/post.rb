# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  acts_as_commontable
  
end
