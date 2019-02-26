require 'rails_helper'

RSpec.feature "User signup", type: :feature do
    scenario 'User can fill in information successfully and gets redirected to user page' do
        visit "/users/new"
        fill_in :user_email, with: "testuser123@makers.com"
        fill_in :user_password, with: "abc123"
        fill_in :user_password_confirmation, with: "abc123"
        fill_in :user_first_name, with: "Test"
        fill_in :user_last_name, with: "User"
        click_button "Create User"
        expect(page).to have_content "successfully created"
    end
end
