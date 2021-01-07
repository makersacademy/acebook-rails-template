class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  after_initialize :init

  acts_as_commontable dependent: :destroy

  attr_accessor :user_id

  def init
    self.likes  ||= 0
  end

end
