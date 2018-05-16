require 'rails_helper'
def user_signs_up
  visit "/users/sign_up"
  fill_in "user_email", with: "jordan@matt.com"
  fill_in "user_password", with: "123456abc"
  fill_in "user_password_confirmation", with: "123456abc"
  click_button "Sign up"
end

RSpec.feature "Login", type: :feature do
  scenario "The user can sign up successfully" do
    user_signs_up
    expect(page).to have_content("Signup successful, welcome jordan@matt.com")
  end

end
