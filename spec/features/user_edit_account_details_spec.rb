require 'rails_helper'
require 'web_helpers'

RSpec.feature "User Account Details", type: :feature do
  scenario "User can delete account" do
    visit "/"
    sign_up_steps
    click_link('My Account')
    click_button('Cancel my account')
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end

  scenario "User can change their password" do
    visit "/"
    sign_up_steps
    click_link('My Account')
    fill_in "user_email", with: 'test@gmail.com'
    fill_in "user_password", with: 'new123'
    fill_in "user_password_confirmation", with: 'new123'
    fill_in "user_current_password", with: 'test123'
    click_button('Update')
    expect(page).to have_content("Your account has been updated successfully.")
  end

end
