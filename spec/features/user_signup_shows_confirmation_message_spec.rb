require 'rails_helper'

RSpec.feature "Sign up message", type: :feature do

  scenario "After sign up, user sees message saying sign up complete" do
    visit "/users/new"
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '123'
    click_button "Create my account"
    expect(page).to have_content("Congratulations, you are signed up!")
  end

  scenario "After sign up and refresh of posts page, no message is displayed" do
    visit "/users/new"
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '123'
    click_button "Create my account"
    visit current_path

    expect(page).to_not have_content("Congratulations, you are signed up!")
  end
end
