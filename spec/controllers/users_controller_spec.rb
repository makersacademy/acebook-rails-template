require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #profile" do
    it "expcect 302 code as user is not logged in" do
      get :profile
      expect(response).to have_http_status(302)
    end

    it "expcect success code" do
      login_admin
      get :profile
      expect(response).to have_http_status(:success)
    end

  end

end
