module ApplicationHelper
  def current_url_contains segment
    return request.env['PATH_INFO'].include? segment
  end
  def user_logged_in?
    return session[:user_id] != nil
  end
end
