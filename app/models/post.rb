class Post < ApplicationRecord
  belongs_to :user

  # 

  def update_time_check
    if Time.now.to_i < self.created_at.since(600).to_i
      true
    else 
      false
    end
  end
    
end
