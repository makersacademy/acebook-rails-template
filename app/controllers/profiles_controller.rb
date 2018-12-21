class ProfilesController < ApplicationController
  before_action :authenticate_user!


respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    @profile = User.find(current_user.id)
    # user = {text: params[:text], poster_id: 999}
    # params[:text]

    @post = Post.new
    @posts = Post.all
  end

  def createpost
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @post = Post.create({"text"=>params[:post][:text], "poster_id"=> current_user.id, "recipient_id"=>profile_path(current_user)})
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
