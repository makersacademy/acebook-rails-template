require 'rails_helper'

RSpec.feature 'Logged in user can logout', type: :feature do
  scenario 'A user can login and then logout' do
    sign_up
    sign_in
    click_link('Logout')
    expect(page).to have_content('Sign up')
  end
end
