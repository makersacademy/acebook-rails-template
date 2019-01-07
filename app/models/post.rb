class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  include Gravtastic
  gravtastic secure: :true,
             filetype: :gif,
             size: 250,
             default: "monsterid"
end
