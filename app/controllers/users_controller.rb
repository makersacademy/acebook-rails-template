class UsersController < Clearance::UsersController
  def create
    # completely overwriting it
    @user = user_from_params

    if @user.save
      sign_in @user
      flash[:message] = 'A helpful message to say you\'ve been signed in!'
      redirect_back_or url_after_create
    else
      flash[:error] = 'Unable to create account'
      render template: 'users/new'
    end
  end

  # protected
  def url_after_create
    '/profile'
  end

  def show
    @posts = Post.where(
      "user_id = '#{params[:id]}' or to_user_id = '#{params[:id]}'"
    ).order('created_at DESC')
    @wall_post = Post.new
  end
end
