require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  it "assigns a newly created comments as comment" do
    @user = User.create!(email: "test@test.com", password: 'testtest')
    allow(controller).to receive(:current_user) { instance_double("User", :id => @user.id)}
    @post = Post.create!(description: "content")
    post :create, :params => {post_id: @post.id, :comment => {body: "some comment"}}
    expect(assigns(:comment)).to be_a(Comment)
    expect(assigns(:comment)).to be_persisted
    expect(response).to redirect_to(@post)
  end


  it 'deletes a comment' do
    @post = Post.create!(description: "content")
    comment = @post.comments.create({body: 'content'})
    @post.comments << comment # not necessary
    expect {delete :destroy, :params => {:id => comment.id, post_id: @post}}.to change{@post.comments.count}.by(-1)
    expect(response).to redirect_to(@post)
  end
  
end
