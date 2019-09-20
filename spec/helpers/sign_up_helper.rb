
def sign_up
  visit "/"
  fill_in "user[email]", with: "test@gmail.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Sign up"
end


def sign_up_other_user
  visit "/"
  fill_in "user[email]", with: "test_other@gmail.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Sign up"
end

def sign_up_third_user
  visit "/"
  fill_in "user[email]", with: "test_third@gmail.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Sign up"
end
