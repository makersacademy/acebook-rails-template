class Post < ApplicationRecord
  belongs_to :user

  acts_as_votable

  def update_time_check
    if Time.now.to_i < self.created_at.since(600).to_i
      true
    else 
      false
    end
  end
    
end
