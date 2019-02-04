class Post < ApplicationRecord
  belongs_to :user

  def edit_timer?
    Time.now < (created_at + 600)
  end

end
