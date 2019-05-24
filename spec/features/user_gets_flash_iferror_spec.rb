require 'rails_helper'

RSpec.feature 'Flash Message', type: :feature do
  scenario 'gets flash feedback' do
    visit '/signup'
    fill_in 'name', with: 'testflash'
    fill_in 'email', with: 't@email.com'
    fill_in 'password', with: 'testflash'
    click_button 'Submit'
    expect(page).to have_content('Login')
  end

  scenario 'gets flash feedback' do
    visit '/login'
    fill_in 'email', with: 't@email.com'
    fill_in 'password', with: 'testflash'
    click_button 'Login'
    expect(page).to have_content('Login Invalid email or password')
  end
end
