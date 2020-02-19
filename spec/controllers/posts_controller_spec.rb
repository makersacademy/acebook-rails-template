# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = User.create!(username: 'daisy', email: 'flower@garden.com', password: 'password1')
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to redirect_to(home_path)
    end
  end
end
