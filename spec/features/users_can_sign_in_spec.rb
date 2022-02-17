require 'rails_helper'

feature 'sign in' do
  scenario 'users get to a sign in page' do
    visit('/')
    click_link("Sign In")
    # expect to see the form
    expect(page).to have_content("Email")
    expect(page).to have_content("Remember me")
  end
  scenario 'user is signed in after filling in form' do
    sign_up
    click_link("Sign Out")
    click_link("Sign In")
    fill_in("user_email", with: "hello@hello.com")
    fill_in("user_password", with: "123456")
    click_button("Log in")
    expect(page).to have_content("Signed in successfully.")
  end
end