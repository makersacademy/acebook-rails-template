class WallController < ApplicationController
  before_action :require_permission, only: [:edit, :destroy]
  before_action :require_time_check, only: :edit

  def show
    user_id = params[:user_id]
  end

end
