require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe 'POST #create' do
    it 'creates a user and redirects them to the posts/wall page' do
      post :create, params: { user: { name: 'Ben', email: 'ben@example.com', password: "123456", password_confirmation: "123456" } }
      expect(User.find_by({ email: 'ben@example.com' })).to be
      expect(response).to redirect_to('/posts')
    # expect(response).to redirect_to('/wall/ben')
    end

    # it 'redirects back to users/new if no name is provided' do
    #   post :create, params: { user: { name: '', email: 'ben@example.com', password: "123456", password_confirmation: "123456" } }
    #   expect(User.find_by({ email: 'ben@example.com' })).not_to be
    #   expect(response).to redirect_to('/signup')
    # end
  end
end
