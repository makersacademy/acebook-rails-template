
def create_post(message: "Hello, world!")
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
