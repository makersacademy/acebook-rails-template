require 'rails_helper'

RSpec.describe WallController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    user.create_wall!
    sign_in
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
