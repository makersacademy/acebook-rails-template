def convert_time_check
  posts = Post.all
  time_check = posts[0].created_at
  converted_time = time_check.strftime("%B %e, %Y at %I:%M %p")
end
