require 'rails_helper'

RSpec.describe "/users", type: :request do
  
  describe "GET /new " do
    it "responds with 200" do
      get new_user_url
      expect(response).to have_http_status(200)
    end
  end

    describe "GET /users/:id " do
      it "responds with 200" do
        get user_url(1)
        expect(response).to have_http_status(200)
      end
    end
  
    describe "GET /users/:id/edit " do
      it "responds with 200" do
        get edit_user_url(1)
        expect(response).to have_http_status(200)
      end
    end

end

RSpec.describe UsersController, type: :controller do

  describe "POST /" do
    it "redirects to login" do
      post :create, params: { user: { username: "testing_user", password: "password", email: "someone@something.com" } }
      expect(response).to redirect_to("/login")
    end

    it "creates a user" do
      post :create, params: { user: { username: "testing_user", password: "password", email: "someone@something.com" } }
      expect(User.find_by(username: "testing_user")).to be
    end
  end

  describe "PATCH/PUT /users/:id " do
    it "redirects back" do
      put :update, params: {id: 1, user: { username: "renaming_test_user", password: "password" } }
      expect(response).to redirect_to("/users/1")
    end

    it "edits a user" do
      put :update, params: {id: 1, user: { username: "renaming_test_user", password: "password" } }
      expect(User.find_by(username: "testing_user")).not_to be
      expect(User.find_by(username: "renaming_test_user")).to be
    end
  end

  describe "DELETE /users/:id " do
    it "logs out when deleting account" do
      delete :destroy, params: {id: 1}
      expect(response).to redirect_to("/logout")
    end

    # it "deletes a user" do
    #   put :destroy, params: { id: 1 }
    #   expect(User.find_by(username: "testuser1")).not_to be
    # end

    it "deletes user's avatar" do
      put :destroy, params: { id: 1, delete_avatar: true }
      expect(User.find_by(username: "testuser1")).to be
      # Expect user to still exist
    end
  end
end
