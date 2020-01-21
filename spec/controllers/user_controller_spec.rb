require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe 'POST #create' do

    it 'creates a user and redirects them their posts/wall page' do
      post :create, params: { user: { name: 'Ben', email: 'ben@example.com', password: "123456", password_confirmation: "123456" } }
      expect(User.find_by({ email: 'ben@example.com' })).to be
      expect(response).to redirect_to('/posts')
    # expect(response).to redirect_to('/wall/ben')
    end

    context "When a user already has an account" do
      before(:each) do
        @user = User.create(name: 'Ben', 
        email: 'ben@example.com', 
        password: "123456",
        password_confirmation: "123456")
        post :create, params: { user: { name: 'Ben', email: @user.email, password: "123456", password_confirmation: "123456" } }
      end

      it 'should not create a duplicate record of the user' do
        result = User.where email: @user.email
        expect(result.length).to eq 1
      end
      it 'redirects to the login page' do
        expect(response).to redirect_to('/login')
      end
      it 'displays a notice, informing them that they already have an account' do
        expect(flash[:notice]).to match('Already a user, please log in')
      end
    end

    context 'When a user enters a password less than 6 characters' do
      before(:each) do
        post :create, params: { user: { name: 'Ben', email: 'ben@example.com', password: "12345", password_confirmation: "12345" } }
      end

      it 'redirects them back to the signup page' do
        expect(response).to redirect_to('/signup')
      end

      it 'displays a notice, informing them their must be at least 6 characters' do
        expect(flash[:notice]).to include('Password must be at least 6 characters')
      end
    end

    context 'When a user enters a password more than 10 characters' do
      before(:each) do
        post :create, params: { user: { name: 'Ben', email: 'ben@example.com', password: "12345678910", password_confirmation: "12345678910" } }
      end

      it 'redirects them back to the signup page' do
        expect(response).to redirect_to('/signup')
      end

      it 'displays a notice, informing them their must be at least 6 characters' do
        expect(flash[:notice]).to match('Password must be at least 6 characters and no more than 10')
      end
    end

    context "When a user's password and password confirmation input don't match" do
      before(:each) do
        post :create, params: { user: { name: 'Ben', email: 'ben@example.com', password: "123456", password_confirmation: "654321" } }
      end

      it 'redirects them back to the signup page' do
        expect(response).to redirect_to('/signup')
      end

      it 'displays a notice, informing them their passwords must match' do
        expect(flash[:notice]).to match('Please confirm your password again')
      end
    end
  end

    # it 'redirects back to users/new if no name is provided' do
    #   post :create, params: { user: { name: '', email: 'ben@example.com', password: "123456", password_confirmation: "123456" } }
    #   expect(User.find_by({ email: 'ben@example.com' })).not_to be
    #   expect(response).to redirect_to('/signup')
    # end
end
