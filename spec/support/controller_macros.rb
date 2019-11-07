module ControllerMacros

  def controller_login_user
    factoryboi
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end

def factoryboi
  FactoryBot.define do
    factory :user do
      email { "test@test.com" }
      username { 'Jay' }
      password { "password" }
      password_confirmation { "password" }
    end
  end
end
