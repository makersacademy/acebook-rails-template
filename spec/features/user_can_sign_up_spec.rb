require 'rails_helper'

RSpec.feature "sign up", type: :feature do

  scenario "user signs up sucessfully" do
    signup_as_new_user("Duncan")
    login_as_user("Duncan")
    expect(page).to have_content("Duncan-Lizard")
  end

  scenario "users creating account with duplicate username throws error message" do
    signup_as_new_user("Duncan")
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Duncan-Lizard"
    fill_in "user[password]", with: "password"
    fill_in "user[email]", with: "#Duncan@lizard.com"
    fill_in "user[full_name]", with: "Dr Duncan Lizard"
    select "Gecko", :from => "user[lizard_species]"
    fill_in "user[birthday]", with: "01/01/2019"
    fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    click_button "Create Account"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("username has already been taken")
  end

  scenario "users creating account with 4 character password throws error message" do
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Lizard"
    fill_in "user[password]", with: "pas"
    fill_in "user[email]", with: "Lizard@lizard.com"
    fill_in "user[full_name]", with: "Dr Lizard"
    select "Gecko", :from => "user[lizard_species]"
    fill_in "user[birthday]", with: "01/01/2019"
    fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    click_button "Create Account"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("password is too short (minimum is 6 characters)")
  end

  scenario "users creating account with more than 10 character password throws error message" do
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Lizard"
    fill_in "user[password]", with: "passwordistoolong"
    fill_in "user[email]", with: "Lizard@lizard.com"
    fill_in "user[full_name]", with: "Dr Lizard"
    select "Gecko", :from => "user[lizard_species]"
    fill_in "user[birthday]", with: "01/01/2019"
    fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    click_button "Create Account"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("password is too long (maximum is 10 characters)")
  end

  scenario "users creating account with duplicate email throws error message" do
    signup_as_new_user("Duncan")
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Lizard"
    fill_in "user[password]", with: "password"
    fill_in "user[email]", with: "Duncan@lizard.com"
    fill_in "user[full_name]", with: "Dr Lizard"
    select "Gecko", :from => "user[lizard_species]"
    fill_in "user[birthday]", with: "01/01/2019"
    fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    click_button "Create Account"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("email has already been taken")
  end

  scenario "users creating a new account must provide a username" do
    visit "/"
    click_button "Create Account"
    fill_in "user[password]", with: "password"
    fill_in "user[email]", with: "Duncan@lizard.com"
    fill_in "user[full_name]", with: "Dr Lizard"
    select "Gecko", :from => "user[lizard_species]"
    fill_in "user[birthday]", with: "01/01/2019"
    fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    click_button "Create Account"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("username can't be blank")
  end

end
