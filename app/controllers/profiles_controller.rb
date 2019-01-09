class ProfilesController < ApplicationController
  before_action :authenticate_user!


respond_to :html

  def index
    @users = User.all
    @posts = Post.all
    respond_with(@users)
  end

  def show
    @profile = User.find(params[:id])
    @post = Post.new
    @posts = Post.where recipient_username: @profile.username
    @bio = Bio.new
    @bio_profile = Bio.find_by(bio_username: @profile.username)
    @friend = Friend.new
    @friends = Friend.where requester: @profile.username
    @like = Like.new
    @avatar = Avatar.new
    @avatar_profile = Avatar.find_by(username: @profile.username)
  end

  def createpost
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    respond_with(@profile)
  end

  def update
    @posts = Post.all

    # @profile.profile(profile_params)
  end

  def destory
    @profile.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.fetch(:profile, {})
    end

    def comment_params
      params.fetch(:profile).permit(:text)
    end
end
