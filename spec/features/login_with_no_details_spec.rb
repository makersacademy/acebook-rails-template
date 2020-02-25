require 'rails_helper'
require 'spec_helper'

RSpec.feature "Login", type: :feature do
  scenario "No details failure" do
    visit '/'
    
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    
    click_button "Log in"
    save_and_open_page
    expect(page).to have_content("Invalid email/password combination")
  end
end