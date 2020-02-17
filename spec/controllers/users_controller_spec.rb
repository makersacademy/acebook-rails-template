RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      test_user = User.create!(email: 'test@abc.com', password: 'password')
      get(:new, session: { user: test_user })
      expect(response).to redirect_to('/users/' + test_user.id.to_s + '/posts')
    end
  end

  describe '#create' do
    it 'creates new user and saves to database' do
      expect_any_instance_of(User).to receive(:save!)
      get(:create, params: { user: { email: 'test@email.com', password: 'password' }})
    end

    it 'creates new user in the database and saves to session' do
      get(:create, params: { user: { email: 'test@email.com', password: 'password' }})
      expect(session[:user].id).not_to eq(nil)
      expect(session[:user].email).to eq('test@email.com')
      expect(session[:user].password).not_to eq(nil)
    end

    it 'creates new session log and saves to database' do
      expect_any_instance_of(Session).to receive(:save!)
      get(:create, params: { user: { email: 'test@email.com', password: 'password' }})
    end
  end
end
