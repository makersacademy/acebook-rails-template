require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'redirects to posts page if signed in' do
      get(:new, session: { user: true })
      expect(response).to redirect_to('/posts')
    end
  end

  describe '#create' do
    
  end
end
