class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    # redirect_to '/'
  end

  def show
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        p flash
        flash[:success] = "User was successfully created!"
        format.html { redirect_to @user}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "User was successfully updated!"
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = "User was successfully destroyed!"
      format.html { redirect_to users_url}
      format.json { head :no_content }
    end
  end

  private

    def set_user
      begin
        @user = User.find(params[:id])
      rescue
        redirect_to '/'
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end

end
