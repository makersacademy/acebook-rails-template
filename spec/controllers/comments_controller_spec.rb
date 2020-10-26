require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:each) do 
    user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post)
    @new_comment = FactoryBot.create(:comment)
    sign_in(user)
  end 
  
  describe "GET / " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects back to the posts page" do
      post :create, params: { comment: { comment: "This is a comment", post_id: @new_post.id } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { comment: { comment: "This is a comment", post_id: @new_post.id } }
      expect(Comment.find_by(comment: "This is a comment")).to be
    end
  end

  describe "GET /edit" do
    it "renders an edit page" do
      get :edit, params: {id: @new_comment.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /update" do
    it "redirects back to the posts page" do
      patch :update, params: { id: @new_comment.id, comment: { comment: "Oops" } }
      expect(response).to redirect_to(posts_path)
    end
  end

  it "update method changes comment" do
    patch :update, params: {id: @new_comment.id, comment: { comment: "Oops" } }
    expect(Comment.find_by(comment: "Oops")).to be
  end

  describe "DELETE" do
    it 'responds with 200' do
      expect(response).to have_http_status(200)
    end
    it 'should delete a post' do
      expect { @new_comment.destroy }.to change(Comment, :count).by(-1) 
    end 
  end

  

end


