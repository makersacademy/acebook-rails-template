def submit_post(message)
  # visit "/users/#{current_user.id}"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
