module PostHelper
  def keep_line_break(post)
    post.message.gsub("\r\n", '<br/>').html_safe
  end

  def check_if_liked(post, user)
    if user.liked? post
      'unlike'
    else
      'like'
    end
  end

  def older_than_10_mins?(post)
    Time.now - post.created_at < 600
  end
end
