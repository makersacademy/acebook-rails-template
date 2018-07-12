def submit_post_successfully
  fill_in "post_message", with: "Hello, world!"
  click_button "Post"
end
