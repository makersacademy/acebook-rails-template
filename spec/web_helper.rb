def submit_test_post(content = "test post")
  visit new_post_path
  fill_in :post_content, with: content
  click_on "Create Post"
end

def user_sign_up(name = "Bob")
  visit new_user_registration_path
  fill_in :user_name, with: name
  fill_in :user_email, with: "#{name}@#{name}.com"
  fill_in :user_password, with: "123456"
  fill_in :user_password_confirmation, with: "123456"
  click_button "Sign up"
end

def add_comment(comment)
  visit "/"
  click_on "Comments"
  fill_in :body, with: comment
  click_on "Post"
end
