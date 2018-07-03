def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
  click_button "Submit"
end
