require 'rails_helper'

RSpec.feature "Timeline", type: :feature do


  scenario "Can sign in with correct email, password, and username" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Logout")
  end

  scenario "Cannot sign in with incorrect email" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot
    

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: "john@gmailcom"
    fill_in "Password", with: "123456"
    click_button "Log in"

    expect(page).to have_content(/Invalid Email or password/)
  end

  scenario "Cannot sign in with incorrect email" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot
    

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: "johngmail.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    expect(page).to have_content(/Invalid Email or password/)
  end

  scenario "Cannot sign in with incorrect password" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot
    

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: "john@gmail.com"
    fill_in "Password", with: "123453"
    click_button "Log in"

    expect(page).to have_content(/Invalid Email or password/)
  end 
  
end