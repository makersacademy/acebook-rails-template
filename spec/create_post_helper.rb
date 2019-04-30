def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test message!"
  click_button "Submit"
end
