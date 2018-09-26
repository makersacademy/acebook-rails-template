def submit_test_post
  visit "/posts/new"
  fill_in :post_content, with: "test post"
  click_on "Create Post"
end

def user_sign_up
  visit "/users/sign_up"
  fill_in :user_name, with: "Bob"
  fill_in :user_email, with: "Bob@bob.com"
  fill_in :user_password, with: "123456"
  fill_in :user_password_confirmation, with: "123456"
  click_button "Sign up"
end
