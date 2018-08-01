#sign up
def successful_sign_up
  visit "/"
  fill_in 'First name', with: "test_first_name"
  fill_in 'Last name', with: "test_last_name"
  fill_in 'Email', with: "test_email@keepingitrails.com"
  fill_in 'Password', with: "pa55w0rd"
  click_button "Sign Up"
end

def unsuccessful_sign_up_with_wrong_password
  visit "/"
  fill_in 'First name', with: "test_first_name"
  fill_in 'Last name', with: "test_last_name"
  fill_in 'Email', with: "test_email@keepingitrails.com"
end


#sign in
def successful_sign_in
  path_to_the_sign_in
  fill_in 'Email', with: "test_email@keepingitrails.com"
  fill_in 'Password', with: "pa55w0rd"
  click_button "Log In"
end

def unsuccessful_sign_in_with_wrong_email
  path_to_the_sign_in
  fill_in 'Email', with: "test_email_other@gmail.com"
  fill_in 'Password', with: "pa55w0rd"
  click_button "Log In"
end

def unsuccessful_sign_in_with_wrong_password
  path_to_the_sign_in
  fill_in 'Email', with: "test_email@keepingitrails.com"
  fill_in 'Password', with: "incorrect password"
  click_button "Log In"
end

def path_to_the_sign_in
  visit "/"
  click_link "Already a User?"
end
