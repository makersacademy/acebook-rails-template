# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.profile.build
  end

  def create
    @profile = current_user.profile.create(profile_params)

    redirect_to profile_url
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(params.require(:profile).permit(:message))
      redirect_to action: :index
      flash[:notice] = 'post was updated.'
    else
      render 'edit'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def index
    @profile = Profile.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def destroy
    Profile.find(delete_params).destroy
    # @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:profile).permit(:message, :time)
  end

  def delete_params
    params.require(:id)
  end
end
