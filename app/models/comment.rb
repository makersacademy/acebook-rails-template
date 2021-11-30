class Comment < ApplicationRecord

def ind_comments(id)
  @posts_comments.each do |comments|
    if comments.post_id == id
      @each_posts_comments.push(comments)
    else 
      @each_posts_comments = []
    end 
  end  
end
 
end 
