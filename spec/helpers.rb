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
  fill_in "Email", with: "bang@robot.com"
  fill_in "Password", with: "robotron"
  fill_in "Password confirmation", with: "robotron"
  fill_in "Username", with: "Bang bang"
  click_button "Sign up"

end

def make_post

  visit '/'
  fill_in "post_message", with: "Beep beep"
  click_button "Submit"

end
