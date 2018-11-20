module ApiControllerHelper
  def stub_access_token(token)
    allow_any_instance_of(Api::ApplicationController).to receive(:doorkeeper_token).and_return(token)
  end

  def stub_current_user(user)
    allow_any_instance_of(Api::ApplicationController).to receive(:current_user).and_return(user)
  end
end

RSpec.configure |config| do
  config.include ApiControllerHelper
end
