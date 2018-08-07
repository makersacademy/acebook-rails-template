require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "POST /users/:id/posts/:id/likes" do

    before(:each) do
      @user = User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
      @post = Post.create(user_id: @user.id, message: "Test message")
      post :create, params: { user_id: @user.id, post_id: @post.id }
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/#{@user.id}")
    end

  end

end
