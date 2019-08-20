

def sign_up_second_user
    visit "users/sign_up"
    fill_in "user[email]", with: "test@test.com"

def sign_up
    visit ("/")
    click_link 'Sign up'
    fill_in "user[email]", with: "ben@test.com"

    fill_in "user[password]", with: "testing"
    fill_in "user[password_confirmation]", with: "testing"
    click_button "Sign up"
  end
  
def log_in
    visit('/')
    fill_in "Email", with: "ben@test.com"
    fill_in "Password", with: "testing"
    click_button "commit"
end




