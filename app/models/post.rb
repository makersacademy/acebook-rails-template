class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  MAX_TIME_TO_UPDATE = 600

  def owner
    User.find(user_id).first_name
  end

  def updatable?
    (Time.now - created_at) <= MAX_TIME_TO_UPDATE
  end

  def update_time
    MAX_TIME_TO_UPDATE.to_s
  end

end
