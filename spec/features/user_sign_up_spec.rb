require 'rails_helper'

feature "test sign up" do
 scenario "Can Sign up and see posts page with Hello on it" do
    sign_up
    expect(page).to have_content("Hello")

  end
end

feature "test fails sign up" do
  scenario "user cannot sign up with an invalid email address - goes through 'Form is invalid' code on sign up" do
    visit '/'
    click_button "Sign Up"
    fill_in "Email", with: "invalidemail"
    fill_in "Password", with: "Password"
    click_button "create"
    expect(page).to have_content("Form is invalid")
  end
end



