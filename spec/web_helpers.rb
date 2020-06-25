def sign_up_student
  visit "/"
  click_link "Student Login"
  click_link "Sign up"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  fill_in "Password confirmation", with: "12345q"
  click_button "Sign up"
end

def sign_in_student
  visit "/"
  click_link "Student Login"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  click_button "Log in"
end

def sign_up_mentor
  visit "/"
  click_link "Mentor Login"
  click_link "Sign up"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  fill_in "Password confirmation", with: "12345q"
  click_button "Sign up"
end

def sign_in_mentor
  visit "/"
  click_link "Mentor Login"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  click_button "Log in"
end