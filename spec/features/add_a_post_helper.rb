def add_a_post
  visit "/users/sign_up"
  fill_in "user[user_name]", :with => 'testUser'
  fill_in "user[email]", :with => 'test@test.com'
  fill_in "user[password]", :with => '123456'
  fill_in "user[password_confirmation]", :with => '123456'
  click_button "Sign up"
  fill_in "exampleTextarea", :with => 'test message'
  click_button "Add post"
end
