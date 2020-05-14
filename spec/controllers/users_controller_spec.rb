require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects to the posts page' do
      post :create, params: { user: { name: "Gina", password: "123456", email: "gina@example.com" } }
      expect(response).to redirect_to "/users/#{User.first.id}"
    end
  end
  
  # describe 'GET /user/1' do
  #   it 'responds with 200' do
  #     User.create(name: "Gina", password: "123456", email: "gina@example.com")
  #     post :create, params: { session: { name: "Gina", password: "123456" } }
  #     # get :show
  #     expect(response).to have_http_status(200)
  #   end 
  # end 
end
