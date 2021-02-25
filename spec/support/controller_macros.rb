module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
      user.save
      sign_in user
    end
  end
end
