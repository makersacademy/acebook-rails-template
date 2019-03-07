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

def add_a_post_two
  visit "/users/sign_up"
  fill_in "user[user_name]", :with => 'testUserTwo'
  fill_in "user[email]", :with => 'testTwo@test.com'
  fill_in "user[password]", :with => '1234567'
  fill_in "user[password_confirmation]", :with => '1234567'
  click_button "Sign up"
  fill_in "exampleTextarea", :with => 'test message two'
  click_button "Add post"
end
