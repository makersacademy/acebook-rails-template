require 'rails_helper'

RSpec.feature 'User log out', type: :feature do
  scenario 'User can log out of a sesion' do
    create_user
    login_user
    visit '/'
    click_link 'Log Out'
    expect(page).to have_content('Signed out successfully')
  end
end
