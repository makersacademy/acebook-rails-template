require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "successful post and redirect to welcome page" do
      post :create, params: { user: { name: "Bob", email: "bob@bob.com", password: "1234567" } }
      expect(response).to redirect_to("/")
    end

    it "unsuccessful post due to incomplete input and not page redirect" do
      post :create, params: { user: { name: "", email: "bob@bob.com", password: "1234567" } }
      expect(response).not_to redirect_to(welcome_url)
    end
    it "creates a user" do
      post :create, params: { user: { name: "Bob", email: "bob@bob.com", password: "1234567" } }
      expect(User.find_by(email: "bob@bob.com")).to be
    end
  end

end
