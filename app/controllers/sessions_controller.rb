class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        # redirect_to action: "show", id: @user.id
        p params
        redirect_to user_wall_path(@user)
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
