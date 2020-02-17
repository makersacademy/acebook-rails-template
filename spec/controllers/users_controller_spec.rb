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
  end
end
