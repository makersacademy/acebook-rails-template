class RegistrationsController < Devise::RegistrationsController

# RegistrationsController is inherited / imported from Devise::RegistrationsController class (available to view on GitHub)

  private

# The params is an instance of the ActionController::Parameters which gives us access to a number of methods. 
# require method - ensures that a specific parameter is present, and if it's not provided, the require method throws an error.
# permit method - method returns a copy of the parameters object, returning only the permitted keys and values.

# only name, email, password, password_confirmation is going to be passed into our Model.  

  def sign_up_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation, 
                                  :current_password)
  end
end