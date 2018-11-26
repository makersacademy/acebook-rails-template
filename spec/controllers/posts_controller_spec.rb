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
      expect(json['status']).to eq 401
    end
  end

  describe 'GET /' do
    before(:each) do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:post)
      post3 = FactoryBot.create(:post, message: "Test")
    end

    before { get "/posts" }

    it 'responds with posts' do
      expect(json.length).to eq 3
      expect(json[0]["message"]).to eq "Test"
    end
  end

end
