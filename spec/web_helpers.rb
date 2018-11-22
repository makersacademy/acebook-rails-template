def visit_site_sign_up
  visit '/posts'
  click_link 'Sign Up'
  expect(page).to have_current_path("/users/sign_up")
  fill_in "user[username]", with: "username123"
  fill_in "user[email]", with: "user@user.com"
  fill_in "user[password]", with: "pword123"
  fill_in "user[password_confirmation]", with: "pword123"
  click_button "Sign up"
end

def hello_world_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
