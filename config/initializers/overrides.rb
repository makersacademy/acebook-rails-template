Devise::RegistrationsController.class_eval do

    def sign_up_params
      puts 'sign up params in override'
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
