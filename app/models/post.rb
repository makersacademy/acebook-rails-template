class Post < ApplicationRecord

  belongs_to :user

  validate :more_than_10_minutes_ago, on: :after_create

  validates :message, presence: true,
    length: { minimum: 1 }


  def more_than_10_minutes_ago
    if created_at > 10.minutes.ago
      true
    else
      false
    end
  end

end
