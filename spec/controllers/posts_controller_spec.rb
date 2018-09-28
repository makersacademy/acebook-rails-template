require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "user not logged in" do
    describe "GET /new " do
      it "responds with 302" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /" do
      it "responds with 302" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#create' do
    it "adds a post with user id to the database" do
      @post = Post.create({ message: 'test', user_id: 1})
      expect(Post.all.include?(@post)).to be(true)
    end
  
    it "doesn\'t add empty message" do
      @post = Post.create({message: ''})
      expect(Post.all.include?(@post)).to be(false)
    end
  end
end
