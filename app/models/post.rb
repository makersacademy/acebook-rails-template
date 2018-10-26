class Post < ApplicationRecord
  belongs_to :user

  def format_date
    full_time = created_at
    full_time.strftime('%A, %-d %b %Y at %-I:%M %p')
  end

  def older_than_10_mins?
    (Time.now - created_at) > 10.minutes
  end

  validates :message, presence: true
end
