# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Password Reset', type: :feature do
  scenario 'user can reset password' do
    visit '/'
    create_user
    visit '/'
    click_link 'Login'
    click_link 'Forgot your password?'
    expect(current_path).to eq('/users/password/new')
    expect(page).to have_content('Forgot your password?')
  end
end