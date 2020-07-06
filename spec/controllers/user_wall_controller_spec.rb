require 'rails_helper'

RSpec.describe WallController, type: :controller do

  describe "GET /:user_id/", :focus => true do
    xit "responds with 200" do
      sign_in
      ### ADD user_id = 1 to DB
      get :show, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
  end

end
