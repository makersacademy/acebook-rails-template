require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  before(:each) do
    request.env["HTTP_REFERER"] = root_url
    @user = User.create!(:email => 'el@el.com', :password => '1234567')
    @post = Post.create!(:description => 'content', :creator_id => @user.id)
    allow(controller).to receive(:current_user) { instance_double("User", :id => @user.id)}
    # how to get current_user in spec?
  end

  describe "POST #reate" do
    it "creates a new like" do
      post :create, :params => {post_id: @post.id}
      expect(Like.first).to be_a(Like)
      expect(Like.first).to be_persisted
      expect(response).to redirect_to root_url
    end
  end

    describe "DELETE #destroy" do
      it "destroys the requested like" do
        @like = @post.likes.create({ post_id: @post.id, user_id: @user.id })
        params = ({:id => @like.id, post_id: @post.id, user_id: @user.id})
        expect {delete :destroy, :params => params }.to change{@post.likes.count}.by(-1)
      end
    end

end
