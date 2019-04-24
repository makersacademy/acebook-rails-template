require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      post :create
      expect(response).to redirect_to(posts_url)
    end
  end
end
