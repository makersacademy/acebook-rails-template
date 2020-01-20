class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        # redirect_to action: "show", id: @user.id
        redirect_back_or url_after_create
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
