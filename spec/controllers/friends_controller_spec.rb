require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  describe "POST /users/:user_id/friends/create" do
    it "responds with 200" do
      post :create, params: { user_id: 1, friend: { requester_id: 1 } }
      expect(response).to redirect_to("/")
    end

    it "creates a friend request" do
      post :create, params: { user_id: 1, friend: { requester_id: 1 } }
      friend_request = Friend.find_by(requester_id: 1)
      expect(friend_request.receiver_id).to eq 1
    end
  end

  describe "PATCH /users/:user_id/friends/:id" do
    before do
      post :create, params: { user_id: 1, id: 1, friend: { requester_id: 1 } }
      # create friend request
      patch :update, params: { user_id: 1, id: 1, friend: { requester_id: 1 } }
      # accept friend request
    end

    it "responds with 200" do
      expect(response).to redirect_to("/")
    end

    it "accepts a friend request" do  
      friend_request = Friend.find_by(requester_id: 1, receiver_id: 1)
      expect(friend_request.status).to eq "Accepted"
    end
  end

  describe "DELETE /users/:user_id/friends/:id" do
    before do
      post :create, params: { user_id: 1, id: 1, friend: { requester_id: 1 } }
      # create friend request
      delete :destroy, params: { user_id: 1, id: 1, friend: { requester_id: 1 } }
      # delete friend request
    end

    it "responds with 200" do
      expect(response).to redirect_to("/")
    end

    it "removes a friend/friend request" do  
      friend_request = Friend.find_by(requester_id: 1, receiver_id: 1)
      expect(friend_request).not_to be
    end
  end

  describe "GET /users/:user_id/notifications" do
    it "responds with 200" do
      get :index, params: { user_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

end
