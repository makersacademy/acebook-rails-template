class SessionsController < ApplicationController

  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        redirect_to action: "show", id: @user.id
      else
        flash.now.alert = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  # def wall
  #   p user_from_params
  # end
end