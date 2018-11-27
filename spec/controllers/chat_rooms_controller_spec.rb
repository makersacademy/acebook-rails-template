require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  describe 'GET #index' do
    before do
      user = create(:user)
      sign_in user
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'redirects if user is not signed in' do
      user = create(:user)
      sign_out user
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #new' do
    before do
      user = create(:user)
      sign_in user
    end

    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'redirects if user is not signed in' do
      user = create(:user)
      sign_out user
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'POST #create' do
    before do
      user = create(:user)
      sign_in user
      room = create(:chat_room)
    end

    it 'redirects to chat rooms index if successfully saves chat room' do
      room = create(:chat_room)
      post :create, params: { chat_room: { title: "Hello, world!" } }
      expect(response).to have_http_status(:redirect)
    end

    it 'does not redirect if not saved successfully' do
      post :create, params: { chat_room: { title: nil } }
      expect(response).to render_template(:new)
    end
  end
end
