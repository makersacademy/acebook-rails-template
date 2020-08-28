require 'rails_helper'

RSpec.feature 'users can log out' do
  scenario 'signed up user can log out' do
    sign_up
    click_link('Log out')
    expect(page).to have_content('Log in')
  end
end
