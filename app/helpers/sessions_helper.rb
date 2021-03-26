module SessionsHelper

    def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user
    end

    def signed_in?
        !!current_user
    end

    def current_user=(user)
        @current_user = user
    end

    def not_signed_in_redirect
        unless signed_in?
         flash[:not_signed_in] = "You must be signed in to view that page!"
         redirect_to :root
        end
    end

    def current_user
        @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end

    def sign_out
        self.current_user = nil
        cookies.delete(:remember_token)
    end

end
