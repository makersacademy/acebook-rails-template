require 'rails_helper'

RSpec.describe "TimelinePosts", type: :request do
  describe "GET /timeline_posts" do
    it "works! (now write some real specs)" do
      get timeline_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
