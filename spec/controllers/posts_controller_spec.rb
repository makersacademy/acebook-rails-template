require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  it 'should show post' do
    post = Post.new
    post = Post.create!(description: "content")
    get :show, params: { id: post.id }
    expect(response.status).to eq(200)
  end

  it "assigns all posts as @posts" do
    post = Post.create!(description: "content")
    get :index
    assigns(:posts).should eq([post])
  end

  it "assigns the requested post as @post" do
    post = Post.create!(description: "content")
    get :edit, params: { id: post.id }
    assigns(:post).should eq(post)
  end

end


