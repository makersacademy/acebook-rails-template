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
    it 'responds with 302 (redirect)' do
      expect(json['status']).to eq 'bad'
    end
  end
end
