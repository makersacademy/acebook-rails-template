def create_user_and_log_in
  visit '/'
  fill_in :user_email, with: "joe@joe.com"
  fill_in :user_password, with: "123456"
  fill_in :user_password_confirmation, with: "123456"
  click_button "Create User"
  visit "/login"
  fill_in :email, with: "joe@joe.com"
  fill_in :password, with: "123456"
  click_button "login"
end 
