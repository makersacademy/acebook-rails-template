require 'rails_helper'

RSpec.feature "Session/ Sign-in", type: :feature do

  before(:each) do
    successful_sign_up
  end

  scenario "A user can sign in with valid credentials" do

    visit "/session/new"
    fill_in :email, with: "elishka@keepingitrails.com"
    fill_in :password, with: "pa55w0rd"
    click_button "Log In"

    expect(page).to have_content("Welcome Elishka")
  end

  scenario "A user signs in with invalid email address" do

    visit "/session/new"
    fill_in :email, with: "jay@gmail.com"
    fill_in :password, with: "pa55w0rd"
    click_button "Log In"
    expect(page).to raise_error("Sorry, we do not recognise this email address")
  end

  scenario "A user signs in with incorrect password" do

    visit "/session/new"
    fill_in :email, with: "elishka@keepingitrails.com"
    fill_in :password, with: "incorrect password"
    click_button "Log In"
    expect(page).to raise_error("Sorry, please check your password and try again")
  end
end
