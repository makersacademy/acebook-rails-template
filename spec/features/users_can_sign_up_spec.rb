require 'rails_helper'

RSpec.feature 'Main page signup', type: :feature do
  scenario 'Users can sign up' do
    sign_up
    expect(page).to have_content('Welcome, Sassy')
  end

  scenario 'Users can not sign up twice with same name' do
    sign_up
    sign_up
    expect(page).to have_content('Sorry, username not available!')
  end
end
