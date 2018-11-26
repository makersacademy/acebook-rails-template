# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe 'POST /' do
    before { post "/users", params: { user: { name: 'Jeff', email: 'jeff@hotmail.com', password: 'password1' } } }

    it 'responds with 200' do
      expect(json['name']).to eq("Jeff")
      expect(json['email']).to eq("jeff@hotmail.com")
    end
  end

end
