class Post < ApplicationRecord
  belongs_to :user

  MAX_TIME_TO_UPDATE = 600

  def owner
    User.find(user_id).first_name
  end

  def updatable?
    (Time.now - created_at) <= MAX_TIME_TO_UPDATE
  end

end
