RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      get(:new, session: { user: true })
      expect(response).to redirect_to('/posts')
    end
  end

  describe '#create' do
    it 'it saves logged in user to session' do
      User.create!(email: 'test@email.com', password: 'password')
      get(:create, params: { login: { email: 'test@email.com', password: 'password' }})
      expect(session[:user].id).not_to eq(nil)
      expect(session[:user].email).to eq('test@email.com')
      expect(session[:user].password).not_to eq(nil)
    end
  end

  describe '#destroy' do
    it 'it removes user from session' do
      User.create!(email: 'test@email.com', password: 'password')
      get(:create, params: { login: { email: 'test@email.com', password: 'password' }})
      get(:destroy)
      expect(session[:user]).to be(nil)
    end
  end
end
