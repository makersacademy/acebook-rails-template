require 'rails_helper'

RSpec.feature "Timeline", type: :feature do


  scenario "Can sign up with correct email, password, and username" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewr@gmail.com"
    fill_in "Username", with: "rwerwrw"
    fill_in "Password", with: "123456"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content("NEW POST Logout")
  end

  scenario "Cannot sign up with invalid email" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewrgmail.com"
    fill_in "Username", with: "rwerwrw"
    fill_in "Password", with: "123456"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Email is invalid/)
  end

  scenario "Cannot sign up with invalid email" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewr@gmailcom"
    fill_in "Username", with: "rwerwrw"
    fill_in "Password", with: "123456"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Email is invalid/)
  end
  scenario "Cannot sign up with invalid password" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewr@gmail.com"
    fill_in "Username", with: "rfhfhwe"
    fill_in "Password", with: "12346"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Password is too short/)
  end

  scenario "Cannot sign up with invalid password" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewr@gmail.com"
    fill_in "Username", with: "rfhfhwe"
    fill_in "Password", with: "12346fwffefwf"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Password is too long/)
  end

  scenario "Cannot sign up with invalid username" do

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "gurewr@gmail.com"
    fill_in "Username", with: ""
    fill_in "Password", with: "12346fwffefwf"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Username can't be blank/)
  end

  scenario "Cannot sign up with an already existing email" do
    user = FactoryBot.create(:user) 

    # Sign in the user through the interface using Capybara
    visit new_user_registration_path
    fill_in "Email", with: "john@gmail.com"
    fill_in "Username", with: "fsfs"
    fill_in "Password", with: "12346fwffefwf"
    check "user_isAgeOver13"
    click_button "Sign up"

    expect(page).to have_content(/Email has already been taken/)
  end

    scenario "Cannot sign up with an already existing email" do
        user = FactoryBot.create(:user) 
    
        # Sign in the user through the interface using Capybara
        visit new_user_registration_path
        fill_in "Email", with: "johnuy@gmail.com"
        fill_in "Username", with: "123456"
        fill_in "Password", with: "12346fwffefwf"
        check "user_isAgeOver13"
        click_button "Sign up"
    
        expect(page).to have_content(/Username has already been taken/)
      end

      scenario "Cannot sign up if age is less than 13" do
        user = FactoryBot.create(:user) 
    
        # Sign in the user through the interface using Capybara
        visit new_user_registration_path
        fill_in "Email", with: "johnuy@gmail.com"
        fill_in "Username", with: "12345dfggd6"
        fill_in "Password", with: "12346f"
        click_button "Sign up"
    
        expect(page).to have_content(/Age must be over 13/)
      end
  


 
end