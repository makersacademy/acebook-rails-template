def submit_post(message)
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
