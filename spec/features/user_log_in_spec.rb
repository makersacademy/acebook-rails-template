require 'rails_helper'

RSpec.feature "User login in", type: :feature do
  scenario "User can log in after registration" do
    user_sign_up
    
    click_link "Logout"
    
    user_log_in
    
    expect(page).to have_content("Signed in successfully.")
  end
end
