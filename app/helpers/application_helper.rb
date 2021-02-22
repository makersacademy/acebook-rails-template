module ApplicationHelper
  def current_url_contains segment
    return request.env['PATH_INFO'].include? segment
  end
  def current_url_rest_obj objName
    path_arr = request.env['PATH_INFO'].split "/"
    if path_arr[1] == objName and path_arr[-1].to_i > 0
      return true
    end
    return false
  end
  def user_logged_in?
    return session[:user_id] != nil
  end
end
