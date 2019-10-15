require 'rails_helper'

RSpec.describe "ProfilePictures", type: :request do
  describe "GET /profile_pictures" do
    it "works! (now write some real specs)" do
      get profile_pictures_path
      expect(response).to have_http_status(200)
    end
  end
end
