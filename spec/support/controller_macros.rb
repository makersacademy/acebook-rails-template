module ControllerMacros

  def controller_login_user
    build_user_factory
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
  end
end

def build_user_factory
  return if FactoryBot.factories.registered?(:user)

  FactoryBot.define do
    factory :user do
      email { "test@test.com" }
      username { 'Jay' }
      password { "password" }
      password_confirmation { "password" }
    end
  end
end
