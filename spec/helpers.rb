def sign_up_user

  visit "/users/sign_up"
  fill_in "user_email", with: "beep@robot.com"
  fill_in "user_username", with: "Robot"
  fill_in "user_password", with: "cyberdog"
  fill_in "user_password_confirmation", with: "cyberdog"
  click_button "Sign up"

end

def sign_up_second_user

  visit "/users/sign_up"
  fill_in "user_email", with: "bang@robot.com"
  fill_in "user_username", with: "Bang bang"
  fill_in "user_password", with: "robotron"
  fill_in "user_password_confirmation", with: "robotron"
  click_button "Sign up"

end

def make_post(message)

  visit '/'
  fill_in "post_message", with: message
  click_button "Submit"

end
