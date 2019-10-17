class UsersController < ApplicationController
  def show
    login_required
    @user = User.find_by(id: params[:id])

    @posts = Post.where("recipient_id = #{@user.id}").order(:created_at).reverse_order

  end

  def new
    @user = User.new
  end

  def index
    login_required
    @users = User.all
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

  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email,
                                :password, :password_confirmation)
                                
  end

end
