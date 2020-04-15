require 'rails_helper'

RSpec.describe "Profilepictures", type: :request do
  describe "GET /profilepictures" do
    it "works! (now write some real specs)" do
      get profilepictures_path
      expect(response).to have_http_status(200)
    end
  end
end
