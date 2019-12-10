def sign_up_user

  visit "/users/sign_up"
  fill_in "user_email", with: "beep@robot.com"
  fill_in "user_username", with: "Robot"
  fill_in "user_password", with: "cyberdog"
  fill_in "user_password_confirmation", with: "cyberdog"
  click_button "Sign up"

end

def make_post

  visit '/'
  fill_in "Message", with: "Beep beep"
  click_button "Submit"

end
