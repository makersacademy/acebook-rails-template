require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "POST /" do
    it "responds with 302" do
      sign_in
      post :create, params: { post: { message: "Hello, world!", wall_id: 1 } }
      expect(response).to have_http_status(302)
    end
  end

end
