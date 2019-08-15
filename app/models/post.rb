class Post < ApplicationRecord

  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validate :less_than_10_minutes_ago, on: :after_create

  validates :message, presence: true,
    length: { minimum: 1 }


  def less_than_10_minutes_ago
    if created_at > 10.minutes.ago
      true
    else
      false
    end
  end

end
