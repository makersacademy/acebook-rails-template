class Post < ApplicationRecord
  belongs_to :user

  acts_as_commontable dependent: :destroy

  attr_accessor :user_id
end
