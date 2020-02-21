RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      test_user = User.create!(email: 'test@abc.com', password: 'password')
      get(:new, session: { user_id: test_user.id })
      expect(response).to redirect_to('/users/' + test_user.id.to_s + '/posts')
    end
  end
end
