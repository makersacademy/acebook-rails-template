require 'rails_helper'

RSpec.feature "Signing Up", type: :feature do
  scenario "successful sign up" do
    visit('/')
    click_link('Register')
    fill_in(:user_name, with: "user1")
    fill_in(:user_email, with: "user1@test.com")
    fill_in(:user_password, with: "password1")
    fill_in(:user_password_confirmation, with: "password1")
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

end
