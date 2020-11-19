require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    User.create(username: "arakno", full_name: "Arabella Knowles", email: "arakno@makers.com", password_digest: "makers4L")
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST /" do
    it "correct info: redirects to /posts" do
      post :create, params: { username: "arakno", password_digest: "makers4L" } 
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(posts_url)
    end
    it "Incorrect info: redirects to /sessions/new" do
      post :create, params: { username: "arabekno", password_digest: "makers4L" } 
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/sessions/new')
    end
  end
  # describe "DELETE" do
  #   it "responds with 200" do
  #     delete
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
