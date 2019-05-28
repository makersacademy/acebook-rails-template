require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "log-in route" do
    it "allows user to log-in" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'redirect to posts#index' do
      user = User.create!(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      get :new
      post :create, params: { session: { email: 'bob@bear.com', password: 'bobby' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'assigns user_id to session' do
      user = User.create!(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      get :new
      post :create, params: { session: { email: 'bob@bear.com', password: 'bobby' } }
      expect(session[:user_id]).to eq user.id
    end
  end

  describe "DELETE #destroy" do
    it 'redirects to login page' do
      user = User.create!(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      get :new
      post :create, params: { session: { email: 'bob@bear.com', password: 'bobby' } }
      delete :destroy
      expect(response).to redirect_to(login_url)
    end

    it 'destroys a session' do
      user = User.create!(first_name: 'Bob', last_name: 'Bear', email: 'bob@bear.com', password: 'bobby')
      get :new
      post :create, params: { session: { email: 'bob@bear.com', password: 'bobby' } }
      delete :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
