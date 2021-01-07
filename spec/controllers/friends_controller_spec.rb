# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  # Add this
  # let(:valid_attributes) do
  #   { post: 'Test post!', message: 'Hello, world!' }
  # end

  let(:user) { FactoryBot.create(:user) }

  describe 'GET /requests' do
    it 'responds with 200' do
      sign_in(user)
      get :requests
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /accept ' do
    it 'correctly redirects after accepting' do
      sign_in(user)
      User.create(id: 2, name: 'Testy123', email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      user2.friend_request(user)
      get :accept, params: { id: user2.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(friend_requests_path)
    end

    it 'correctly adds friend after accepting' do
      sign_in(user)
      User.create(id: 2, name: 'Testy123', email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      user2.friend_request(user)
      get :accept, params: { id: user2.id }
      expect(user.friends.first).to eq(user2)
    end
  end

  describe 'GET /decline ' do
    it 'correctly redirects after declining' do
      sign_in(user)
      User.create(id: 2, name: 'Testy123', email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      user2.friend_request(user)
      get :decline, params: { id: user2.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(friend_requests_path)
    end

    it 'does not add friend after rejecting' do
      sign_in(user)
      User.create(id: 2, name: 'Testy123', email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      user2.friend_request(user)
      get :decline, params: { id: user2.id }
      expect(user.friends.length).to eq(0)
    end
  end

  describe 'GET /list' do
    it 'responds with 200' do
      sign_in(user)
      get :list, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

end

# sign_in(user)
# User.create(id: 2, email: 'testy@testy.com', password: '1234567')
# user2 = User.find_by(email: 'testy@testy.com')
