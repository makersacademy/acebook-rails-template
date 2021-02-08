require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET /posts/1/comments" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
