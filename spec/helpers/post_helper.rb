def post(message)
  click_button "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
