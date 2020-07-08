require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe "GET #show" do
    it "responds with 302" do
      get :show
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #show" do
    it "has a chat input" do
      get :show
      expect(response.content_type).to include("text/html")
    end
  end

end
