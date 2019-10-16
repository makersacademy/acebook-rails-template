require 'rails_helper'
require 'spec_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can Sign Up" do
    visit '/'
    click_link 'Join Now'
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Confirm Password", with: "" 
    click_button "Sign Up"
    save_and_open_page
    expect(page).to have_content("7 errors prohibited this account")
  end
end