RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      test_user = User.create!(email: 'test@abc.com', password: 'password')
      get(:new, session: { user_id: test_user.id })
      expect(response).to redirect_to('/posts')
    end
  end

  describe '#create' do
    it 'it saves logged in user to session' do
      User.create!(email: 'test@email.com', password: 'password')
      get(:create, params: { login: { email: 'test@email.com', password: 'password' }})
      expect(session[:user_id]).not_to eq(nil)
    end
  end

  describe '#destroy' do
    it 'it removes user from session' do
      User.create!(email: 'test@email.com', password: 'password')
      get(:create, params: { login: { email: 'test@email.com', password: 'password' }})
      get(:destroy)
      expect(session[:user_id]).to be(nil)
    end
  end
end
