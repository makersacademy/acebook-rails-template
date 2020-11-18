class SessionsController < ApplicationController
  before_action only: [:new, :create, :destroy]
  
  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    # authenticate(email: params[:email], password: params[:password])
    respond_to do |format|
      if @user
        format.html { redirect_to posts_path}
        session[:user] = @user
        format.json {
          render :show,
          status: :created,
          logged_in: :true,
          user: @user
        }
      else
        render json:{status: 401}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
