module PostHelper
  def keep_line_break(post)
    post.message.gsub("\r\n", '<br/>').html_safe
  end
end 
