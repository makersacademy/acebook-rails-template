require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  # it "assigns a newly created comments as comment", :yo => true do
  #   a_post = Post.create!(description: "content")

  #   @user = User.create!(email: "test@test.com", password: 'testtest')
  #   allow(controller).to receive(:current_user) { instance_double("User", :id => @user.id)}
  #   post :create, :params => {:comment => {body: 'content'}}    

  #   byebug

  #   # comment = post.comments.create!(body: 'content')
  #   # byebug
  #   expect(comment.post_id).to eq(post.id)

  # end


  it 'deletes a comment' do
    @post = Post.create!(description: "content")
    comment = @post.comments.create({body: 'content'})
    @post.comments << comment # not necessary
    expect {delete :destroy, :params => {:id => comment.id, post_id: @post}}.to change{@post.comments.count}.by(-1)
    expect(response).to redirect_to(@post)
  end
  

end
