require 'rails_helper'
require 'web_helpers'


RSpec.feature "User Authentication", type: :feature do
  scenario "Route page has Sign Up and Sign In buttons" do
    visit "/"
    expect(page).to have_content("Welcome to AceBook!")
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Sign In')
  end

  scenario "User can Sign Up" do
    visit "/"
    click_link('Sign Up')
    expect(page).to have_current_path '/users/sign_up'
    fill_in "user_email", with: 'test@gmail.com'
    fill_in "user_password", with: 'test123'
    fill_in "user_password_confirmation", with: 'test123'
    click_button('Sign up')
    expect(page).to have_current_path '/'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  # scenario "User can Sign In" do
  #   sign_up_steps
  #   visit "/"
  #   click_link('Sign In')
  #   expect(page).to have_current_path '/users/sign_in'
  #   fill_in "user_email", with: 'test@gmail.com'
  #   fill_in "user_password", with: 'test123'
  #   click_button('Log in')
  #   expect(page).to have_current_path '/'
  #   expect(page).to have_content("Welcome! You have signed up successfully.")
  # end

  scenario "User can Sign Out" do
    visit "/"
    click_link('Sign Out')
    expect(page).to have_content("Signed out successfully.")
  end


end