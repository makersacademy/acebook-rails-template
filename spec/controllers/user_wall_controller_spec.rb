require 'rails_helper'

RSpec.describe WallController, type: :controller do

  describe "GET / " do
    it "responds with 200", :focus => true do
      sign_in
      get :new
      expect(response).to have_http_status(200)
    end
  end

end
