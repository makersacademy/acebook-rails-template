def sign_up_user

  visit "/users/sign_up"
  fill_in "Email", with: "beep@robot.com"
  fill_in "Password", with: "cyberdog"
  fill_in "Password confirmation", with: "cyberdog"
  click_button "Sign up"

end

def make_post

  visit '/'
  fill_in "Username", with: "Robot"
  fill_in "Message", with: "Beep beep"
  click_button "Submit"

end
