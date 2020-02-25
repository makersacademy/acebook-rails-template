
def sign_up
    visit ("/")
    click_link 'Sign up'
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testing"
    fill_in "user[password_confirmation]", with: "testing"
    click_button "commit"
  end
  
def log_in
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "test@test.com"
    click_button "submit"
end




