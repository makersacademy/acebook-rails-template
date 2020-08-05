require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET users/new user " do
    it "renders the new page for sign up" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST / #create" do
    it "redirects to the welcome page once a successful sign up" do
      post :create, params: { user: { email: "Katie.Jones@Makers.com", password: "123456"  } }
      expect(response).to redirect_to('/')
    end
  end

end
