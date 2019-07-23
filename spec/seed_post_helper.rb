def seed_post
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: "giraffe@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Submit"
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, giraffe!"
  click_button "Submit"
  click_link "Logout"
end
