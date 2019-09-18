class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    # password validation:
    if @user.password.length < 6 || @user.password.length > 10
      flash[:notice] = "Password must be between 6 - 10 characters"
      redirect_to sign_up_url
      return
    end

    if @user.save

      #create a wall instance for this user
      @user.create_wall!
      puts "DEBUG THIS PLACE IS VISITED"


      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  before_action :require_login

  # display all posts belong to a wall
  def wallindex
    @user = User.find(current_user.id)
    @wall = @user.wall
    @posts = @wall.posts
  end

end
