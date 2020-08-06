require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new no login " do
    it "redirects to the welcome page" do
      get :new
      expect(response).to redirect_to('/welcome')
    end
  end
end
