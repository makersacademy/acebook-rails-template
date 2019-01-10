require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
    describe 'GET search' do
      it 'returns a search page' do
        get :search
        expect(response).to render_template('friends/search')
    end
  end
end
