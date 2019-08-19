
def sign_up_second_user
    visit "users/sign_up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testing"
    fill_in "user[password_confirmation]", with: "testing"
    click_button "Sign up"
  end
  
def log_in
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "test@test.com"
    click_button "submit"
end




