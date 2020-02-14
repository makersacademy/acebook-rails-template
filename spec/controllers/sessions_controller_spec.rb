require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      get(:new, session: { user: true })
      expect(response).to redirect_to('/posts')
    end
  end

  describe '#create' do
    it 'redirects if entered email not found' do
      get(:create, params: { login: { email: 'test', password: 'password' }})
      expect(response).to redirect_to(login_path)
    end
    it 'redirects if entered password is incorrect' do
      User.create!(email: 'test@test.com', password: 'password')
      get(:create, params: { login: { email: 'test@test.com', password: 'passrd' }})
      expect(response).to redirect_to(login_path)
    end
  end
end
