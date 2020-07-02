
require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST /' do
    it 'creates a new user' do
      post :create, params: { user: {name: 'Emanuele', email: 'ema@test.com', password_digest: '12345' }}
      expect(User.find_by(name: 'Emanuele')).to be
      expect(User.find_by(password_digest: '12345')).to be
      expect(User.find_by(email: 'ema@test.com')).to be
    end
  end
end
