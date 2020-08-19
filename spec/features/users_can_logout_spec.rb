require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'Can logout as a user and gets sent back to welcome page' do
    visit '/'
   register_user
    visit '/logout'
    expect(page).to have_content('Welcome to Fishbook')
  end
end