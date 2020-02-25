# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'GET #welcome_message' do
    controller_login_user
    it 'welcomes user back with username' do
      allow_any_instance_of(Users::SessionsController).
        to receive_message_chain(:flash, :[]=).
          with(:success, "Welcome back Jay")
      expect(response).to have_http_status(200)
    end
  end
end
