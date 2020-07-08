module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      reject_unauthorized_connection unless current_user
    end

    private

    def cookies
      @cookies ||= ActionDispatch::Request.new(@env).cookie_jar
    end

    def remember_token
      cookies[Clearance.configuration.cookie_name]
    end

    def user_from_remember_token(token)
      Clearance.configuration.user_model.find_by(remember_token: token)
    end
  end
end
