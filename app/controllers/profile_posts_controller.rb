class ProfilePostsController < ApplicationController
  def new
    @user = User.find(params[:user_profile_id])
    @profile_posts = current_user.profile_posts.create
  end

  def create
    @profile_post = current_user.profile_posts.build(post_params)
    p params
    respond_to do |format|
      if @profile_post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @profile_post }
      else
        format.html { render :new }
        format.json { render json: @profile_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    profile_post = ProfilePost.find(params[:id])
    profile_post.update(post_params)
    redirect_to(root_path)
  end

  private

  def post_params
    params.require(:profile_post).permit(:message, :user_id, :user_profile_id)
  end

end
