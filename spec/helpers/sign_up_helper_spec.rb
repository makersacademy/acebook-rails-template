require 'rails_helper'


def user_sign_up
  visit "/"
  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "testing123"
  fill_in "user_password_confirmation", with: "testing123"

  click_button "Sign up"

end
