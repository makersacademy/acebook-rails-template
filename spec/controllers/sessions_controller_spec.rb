require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "doesn't log in" do
      post :create
      # p response
      p response.body
      # p @error
      expect(response).to have_http_status(:success)
      # expect error to exist and expect to render new as well
      expect(response).to render_template("new")
    end
    xit " does log in" do
      # # expect to receive an email and if the password and email are correct we redirect to posts
      # session user_id also exists
    end
  end

  describe "GET #login" do
   xit "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #welcome" do
    xit "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #logout" do
    xit "logs out"do
    # we delete the saved user_id and we set @user to equal nil
  end
end
describe "DELETE #destroy" do
  xit " logs out" do
    # we delete the saved user_id and we set @user to equal nil
    # it calls the logout method and redirects to root_url
  end
end

end
