
def add_new_post
  visit "/posts"
  click_link "New post"
  fill_in "Post a new message", with: "Hello, world!"
  click_button "Submit"
end
