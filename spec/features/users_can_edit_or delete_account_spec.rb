require 'rails_helper'

feature 'edit password', type: :feature do
  scenario 'users can edit their passwords' do
    sign_up
    click_link("Account")
    fill_in("user_email", with: "hello@hello.com")
    fill_in("user_password", with: "012345")
    fill_in("user_password_confirmation", with: "012345")
    fill_in("user_current_password", with: "123456")
    click_button("Update")
    expect(page).to have_content("Your account has been updated successfully.")
  end
  scenario 'users can delete their accounts', type: :feature do
    sign_up
    click_link("Account")
    click_button("Cancel my account")
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end