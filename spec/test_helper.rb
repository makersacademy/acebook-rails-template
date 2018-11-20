ENV['RAILS_ENV'] ||= 'test'

def is_logged_in?
  !session[:user_id].nil?
end
