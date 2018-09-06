require 'rails_helper'

RSpec.feature 'Main page sign in', type: :feature do
  scenario 'Users can sign in' do
    sign_up
    click_link('Logout')
    sign_in
    expect(page).to have_content('Welcome, Sassy')
  end
end
