class Post < ApplicationRecord
  belongs_to :student, required: false
end
