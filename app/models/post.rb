class Post < ApplicationRecord
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy

  def owner?(user)
    self.user_id.to_i == user.id.to_i
  end

  # class methods
  # def self.time_sort
  #   self.all.sort_by { |x| x.created_at }.reverse.each_with_index
  # end
end
