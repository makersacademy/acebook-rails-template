require 'rails_helper'

RSpec.feature "Session/ Sign-in", type: :feature do

  before(:each) do
    successful_sign_up
  end

  scenario "A user can sign in with valid credentials" do
    visit "/session/new"
    fill_in :email, with: "test_email@keepingitrails.com"
    fill_in :password, with: "pa55w0rd"
    click_button "Log In"
    expect(page).to have_content("Welcome test_first_name")
  end

  #not implementing the below feature in this commit:

  # scenario "A user signs in with invalid email address" do
  #
  #   visit "/session/new"
  #   fill_in :email, with: "test_email_other@gmail.com"
  #   fill_in :password, with: "pa55w0rd"
  #   click_button "Log In"
  #   expect(page).to have_content("Sorry, we do not recognise this email address")
  # end
  #
  # scenario "A user signs in with incorrect password" do
  #
  #   visit "/session/new"
  #   fill_in :email, with: "test_email@keepingitrails.com"
  #   fill_in :password, with: "incorrect password"
  #   click_button "Log In"
  #   expect(page).to have_content("Sorry, please check your password and try again")
  # end
end
