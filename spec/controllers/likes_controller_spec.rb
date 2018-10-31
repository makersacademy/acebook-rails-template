require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    user = User.create(name: 'Andres', email: 'email@email.com', password: 'password')
    Post.create(message: 'Please delete me!', user_id: user.id)
  end

  describe 'POST /' do
    it 'responds with 302' do
      post :create, params: { post_id: 1, user_id: 1 }
      expect(response).to redirect_to(posts_url)
    end
  end
end
