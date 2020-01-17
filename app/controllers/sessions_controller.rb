class SessionsController < ApplicationController

  def create
    # p 'hello'
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

  def new
    render template: "sessions/new"
  end

end
