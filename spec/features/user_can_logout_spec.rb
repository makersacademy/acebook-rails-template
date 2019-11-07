# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Logout', type: :feature do
  scenario 'user can logout' do
    create_user
    login_user
    expect(page).to have_link 'Logout'
    click_link 'Logout'
    expect(current_path).to eq('/')
    expect(page).to have_content('Signed out successfully.')
  end
end
