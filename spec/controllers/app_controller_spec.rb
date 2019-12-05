# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe 'user session' do
    it 'redirects to home page' do
      :authenticate_user!
      expect(response).to have_http_status(200)
    end
  end
end
