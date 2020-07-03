require 'rails_helper'

feature 'Log in/ log out' do
  scenario "user can log in and log out of an account" do
    visit ('/signup')
    fill_in 'user_name', with: 'Dave'
    fill_in 'email', with: 'dave@test.co.uk'
    fill_in 'password', with: 'TestPasW0rd'
    fill_in 'user_password_confirmation', with: 'TestPasW0rd'
    click_button 'Sign up'
    expect(page).to have_content('New post')
  end
end