require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  it 'should show post' do
    post = Post.new
    post = Post.create!(description: "content")
    get :show, params: { id: post.id }
    expect(response.status).to eq(200)
  end

  it "could show post creation" do
    get :new
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

  it "assigns a newly created posts as @post" do
    @user = User.create!(email: "test@test.com", password: 'testtest')
    allow(controller).to receive(:current_user) { instance_double("User", :id => @user.id)}
    post :create, :params => {:post => {description: 'content'}}
    # detail this for understanding
    expect(assigns(:post)).to be_a(Post)
    expect(assigns(:post)).to be_persisted
  end

    it "false and flash" do
    @user = User.create!(email: "test@test.com", password: 'testtest')
    allow(controller).to receive(:current_user) { instance_double("User", :id => @user.id)}
    post :create, :params => {:post => {description: ''}}
    expect(controller).to set_flash[:notice]
    expect(response).to redirect_to(posts_path) # to posts is all posts
  end

  it "destroys the requested post" do
    post = Post.create!(description: 'content')
    expect {delete :destroy, :params => {:id => post.to_param}}.to change(Post, :count).by(-1)
  end

  it "updates the requested post" do
    post = Post.create!(description: "content")
    Post.any_instance.should_receive(:update).with({ "description" => "new description" })
    put :update, :params => {:id => post.to_param, :post => { "description" => "new description" }}
  end

  it "update redirects to the post" do
    post = Post.create!(description: "content")
    put :update, :params => {:id => post.to_param, :post => { "description" => "new description" }}
    expect(response).to redirect_to(post) # to post is the specific post
  end

end


