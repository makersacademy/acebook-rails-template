class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def format_date
    full_time = created_at
    full_time.strftime('%A, %-d %b %Y at %-I:%M %p')
  end

  def older_than_10_mins?
    (Time.now - created_at) > 10.minutes
  end

  def liked_by(person)
    likes.find_by(user_id: person.id)
  end

  validates :message, presence: true, length: { maximum: 500 }
end
