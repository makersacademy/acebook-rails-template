def create_three_posts
  user = User.create(name: "simone", email: "mail@simone.com", password: "123456")
  visit user_posts_path(user)
  click_link "New post"
  fill_in "Message", with: "First post"
  click_button "Submit"
  click_link "New post"
  fill_in "Message", with: "Second post"
  click_button "Submit"
  click_link "New post"
  fill_in "Message", with: "Third post"
  click_button "Submit"
end
