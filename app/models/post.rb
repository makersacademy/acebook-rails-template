class Post < ApplicationRecord
  belongs_to :user

  # 

  def self.update_time_check
    if Time.now.to_i > self.created_at.since(600).to_i
      true
    else 
      flash[:alert] = "Post is older than 10 minutes"
      # false
    end
  end
    
end
