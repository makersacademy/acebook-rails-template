class UsersController < ApplicationController
<<<<<<< HEAD
=======

  skip_before_action :authorized, only: [:new, :create]

>>>>>>> 7f51707f6b181b2f9ad4ceffc03750b95057a621
  def new
    @user = User.new
  end

  def create
<<<<<<< HEAD
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to '/posts'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
=======
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/posts' #sub this to /posts later
  end

  def authenticate
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

>>>>>>> 7f51707f6b181b2f9ad4ceffc03750b95057a621
end
