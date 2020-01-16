class SessionsController < ApplicationController

  def create
    p 'hello'
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

  # def show
  #   p 'hello'
  # end

  # def wall
  #   p user_from_params
  # end
end