require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  before(:each) do
    User.create({email: "mynewuser@users.com", password: "goroku666"})
    session[:user_id] = 1
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "adds an album to Database" do
      post :create, params: { album: {name: "test album" }}
      expect(Album.find_by(name: "test album")).to be
    end
    it "redirects to new album's show page" do
      expect(post :create, params: { album: {name: "test album" } }).to redirect_to '/albums/1'
    end
  end
end
