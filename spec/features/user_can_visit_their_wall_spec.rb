# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User's wall", type: :feature do
  scenario 'user redirected to their own wall after login or signup' do
    sign_up(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    user = User.all[0]

    expect(page).to have_current_path("/users/#{user.id}/posts")
  end
end