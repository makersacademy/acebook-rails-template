# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :request do

  let(:message) {'This is a test message'}

  describe 'POST /' do
    before(:each) do
      user = FactoryBot.create(:user)
      stub_current_user(user)
    end
    before { post "/posts", params: { post: { message: message } } }
    it 'responds with 200 and post details' do
      expect(json['message']).to eq message
    end

    it 'creates a post' do
      post = Post.find_by(message: message)
      expect(post).to be
    end
  end

  describe 'POST /' do
    before { post "/posts", params: { post: { message: message } } }
    it 'responds with 401 (unauthorized)' do
      expect(response.status).to eq 401
    end
  end

  describe 'GET /' do
    before(:each) do
      FactoryBot.create(:post)
      FactoryBot.create(:post)
      FactoryBot.create(:post, message: "Test")
    end

    before { get "/posts" }

    it 'responds with posts' do
      expect(json.length).to eq 3
      expect(json[0]["message"]).to eq "Test"
    end
  end

  describe 'PATCH / ' do
    before(:each) do
      user1 = FactoryBot.create(:user)
      stub_current_user(user1)
      FactoryBot.create(:post, message: "Test", user: user1)
    end

    describe 'authorized' do
      before { patch "/posts/1", params: { post: { message: "Changed!"} } }
      it 'responds with correct message' do
        expect(json["message"]).to eq "Changed!"
      end
    end

    describe 'unauthorized' do
      before do
        user2 = FactoryBot.create(:user)
        stub_current_user(user2)
        patch "/posts/1", params: { post: { message: "Changed!"} }
      end
      it 'responds with 401 if user unauthorized' do
        expect(response.status).to eq 401
      end
    end
  end

  describe 'DELETE / ' do
    before do
      user1 = FactoryBot.create(:user)
      stub_current_user(user1)
      @post = FactoryBot.create(:post, message: "Test", user: user1)
      @post2 = FactoryBot.create(:post, message: "Test", user: user1)
      delete "/posts/#{@post.id}"
    end

    describe 'authorized' do
      it 'deletes post with 200' do
        expect(Post.exists?(@post.id)).to eq false
        expect(response.status).to eq 200
      end
    end

    describe 'authorized' do
      before do
        user2 = FactoryBot.create(:user)
        stub_current_user(user2)
        delete "/posts/#{@post2.id}"
      end
      it 'deletes post with 200' do
        expect(Post.exists?(@post2.id)).to eq true
        expect(response.status).to eq 401
      end
    end

  end

end
