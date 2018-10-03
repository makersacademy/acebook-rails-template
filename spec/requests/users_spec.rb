require 'rails_helper'
require 'user_spec_helper'

RSpec.describe 'users API', type: :request do
  before(:each) do
    clear_user_table
    create_users
  end

  describe 'Get /users' do
    before { get '/api/v1/users' }
      it 'returns users' do
        expect(json).not_to be_empty
        expect(json.size).to eq(4)
      end
  end
end
