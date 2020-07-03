require 'rails_helper'

RSpec.describe WallController, type: :controller do

  describe "GET /:user_id " do
    it "responds with 200" do
      sign_in
      get :show, params: { use_route: 'wall/', id: 1 }
      expect(response).to have_http_status(200)
    end
  end

end
