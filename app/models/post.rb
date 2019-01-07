class Post < ApplicationRecord

	belongs_to :user

  has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

  include Gravtastic
  gravtastic secure: :true,
             filetype: :gif,
             size: 250,
             default: "monsterid"
end
