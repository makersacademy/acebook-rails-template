def user_signs_up
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    fill_in "user_password", with: "123456abc"
    fill_in "user_password_confirmation", with: "123456abc"
    click_button "Sign up"
  end
