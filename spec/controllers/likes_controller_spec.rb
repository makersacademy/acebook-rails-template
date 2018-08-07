require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "POST /users/:id/posts/:id/likes/:id" do

    before(:each) do
      post :create, params: { likes: { user_id: 1 , post_id: 1 } }
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/#{assigns(:likes).user_id}")
    end

  end

end
