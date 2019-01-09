require 'rails_helper'

RSpec.describe "Avatars", type: :request do
  describe "GET /avatars" do
    it "works! (now write some real specs)" do
      get avatars_path
      expect(response).to have_http_status(200)
    end
  end
end
