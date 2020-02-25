module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      # user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password')
      sign_in user
    end
  end
end