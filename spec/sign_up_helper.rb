def new_sign_up(testusername, testemail, testpassword)
  visit "/users/sign_up"
  fill_in "user[user_name]", :with => testusername
  fill_in "user[email]", :with => testemail
  fill_in "user[password]", :with => testpassword
  fill_in "user[password_confirmation]", :with => testpassword
  click_button "Sign up"
end