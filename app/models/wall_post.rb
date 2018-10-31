class WallPost < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: 'User'
  validates :text, presence: true

  def format_date
    full_time = created_at
    full_time.strftime('%A, %-d %b %Y at %-I:%M %p')
  end
end
