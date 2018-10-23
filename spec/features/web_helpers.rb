def create_post
  visit "/posts"
  click_link "Create post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
