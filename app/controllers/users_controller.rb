class UsersController < ApplicationController
  def show
    login_required
    @user = User.find_by(id: params[:id])
    @posts = Post.where("recipient_id = #{@user.id}").order(:created_at).reverse_order
    
    @profile_photo = nil
    if @user.profile_photo.attached?
      @profile_photo = url_for(@user.profile_photo)
    else @profile_photo = "/anonymous_profile_phot.jpg"
    end

  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    end

    @user = User.new
  end

  def index
    login_required
    @users = User.all.order(last_name: :asc)
  end

  def create
    @user = User.new(user_params)

    begin
      if @user.save
        flash[:success] = 'You have signed up! Please log in to continue'
        redirect_to '/login' and return
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:danger] = 'Email already exists!'
      render 'new' and return
    end
    render 'new'
  end

  def edit
    login_required
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash.now[:success] = "You profile has been updated!"
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email,
                                :password, :password_confirmation, :profile_photo )
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_photo)
  end

end
