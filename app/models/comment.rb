class Comment < ApplicationRecord
  belongs_to :post

  MAX_TIME_TO_UPDATE = 600

  def owner
    User.find(poster).first_name
  end

  def updatable?
    (Time.now - created_at) <= MAX_TIME_TO_UPDATE
  end

end
