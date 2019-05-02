require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      User.create({email: "mynewuser@users.com", password: "goroku666"})
      session[:user_id] = 1
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      User.create({email: "mynewuser@users.com", password: "goroku666"})
      session[:user_id] = 1
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST#CREATE" do
    it "add an album to Database" do
      User.create({email: "mynewuser@users.com", password: "goroku666"})
      session[:user_id] = 1
      post :create, params: { album: {name: "test album" }}
      expect(Album.find_by(name: "test album")).to be
    end
  end
end
