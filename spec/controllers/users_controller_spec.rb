require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #profile" do
    xit "expect 302 code as user is not logged in" do
      get :profile
      expect(response).to have_http_status(302)
    end
    
  end

end
