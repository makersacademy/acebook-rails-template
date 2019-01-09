require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe "GET #show" do
    it "responds with 302" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(302)
    end
  end

  after :all do
    logout
  end
end
