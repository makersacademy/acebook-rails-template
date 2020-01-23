class WallController < ApplicationController
  before_action :find_user

  def show 
    @wall_id = params[:user_id]
  end

  def find_user
    @wall_owner = User.find_by(id: params[:user_id])
    redirect_to '/404' if @wall_owner.blank?
  end
end
