# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  describe 'GET /friends' do
    it 'works! (now write some real specs)' do
      get friends_path
      expect(response).to have_http_status(302)
    end
  end
end
