require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  
  before do
    sign_in(user)
  end

  describe 'GET /new' do 
    it 'responds with http 200' do 
      get :requests
      expect(response).to have_http_status(200)
    end 
  end 

  describe 'GET /decline' do 
    it 'redirects us to friend_requests_path' do 
      User.create(id: 2, name: 'Testy123', email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      user2.friend_request(user)

      get :decline, params: { id: user2.id }

      expect(response).to redirect_to(friend_requests_path)
    end 
  end 

end 