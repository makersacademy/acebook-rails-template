class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friendships.map do |row|
      User.find(row.friend_id)
    end
  end

  def remove
    User.destroy(params[:format])

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end
end
