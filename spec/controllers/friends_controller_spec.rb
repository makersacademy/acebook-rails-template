require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  describe "POST /users/:user_id/create" do
    it "responds with 200" do
      post :create, params: { user_id: 1, friend: { requester_id: 1 } }
      expect(response).to redirect_to("/")
    end

    it "creates a friend request" do
      post :create, params: { user_id: 1, friend: { requester_id: 1 } }
      expect(Friend.find_by(requester_id: 1)).to be
    end
  end  
end
