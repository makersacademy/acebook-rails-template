# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login



  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create_session(id)
    session[:user_id] = id
  end

  def require_login
     # redirect_to ('/login') unless current_user
     if current_user == nil
       flash[:danger] = 'You must create an account or log in before accessing this'
       redirect_to ('/login')
     end

       # format.html { redirect_to ('/login'), notice: 'You must create an account or log in before accessing this' }
  end

  def require_no_user
     flash.now[:danger] = 'You are already logged in' if current_user
  end

  def friends_of(id)
    Friendship.where(user_id: id)
  end

  helper_method :current_user, :create_session, :friends_of
end
