def sign_up
  visit "/users/sign_up"
  fill_in "user_first_name", with: "Wendy"
  fill_in "user_last_name", with: "McWend"
  fill_in "user_email", with: "wendy@wendy.com"
  fill_in "user_password", with: "WendyWendy"
  fill_in "user_password_confirmation", with: "WendyWendy"
  click_button "Sign up"
end
    # def sign_in
    #   visit '/'
    #   click_link 'Sign In'
    #   fill_in 'Email', with: 'test@test.com'
    #   fill_in 'Password', with: 'Test123'
    #   click_button 'Log in'
    # end
