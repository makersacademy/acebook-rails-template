# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :save_login_state, only: %i[new create]

  def new
    @user = User.new
  end

  def index
    @users = User.search(params[:search])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      successful
    else
      unsuccessful
    end
  end

  def show
    # p params['id']
    # @posts = Post.find_by(recipient_id: params['id'], post_type: 'wall' ).to_a
    @posts = Post.where(recipient_id: params['id'], post_type: 'wall' )
  
  end

  private

  def search_params
    params.permit(:search)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def successful
    flash[:notice] = 'You signed up successfully'
    flash[:color] = 'valid'
    redirect_to '/posts/index'
  end

  def unsuccessful
    flash[:notice] = 'Form is invalid'
    flash[:color] = 'invalid'
    render 'new'
  end
end
