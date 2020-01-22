class WallController < ApplicationController
  before_action :find_user

  def show 
    @wall_id = params[:user_id]
  end

  def find_user
    @wall_owner = User.find(params[:user_id])
  end
end
