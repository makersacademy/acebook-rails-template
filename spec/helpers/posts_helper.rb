def create_two_posts
  fill_in "Message", with: "Message B, displayed below Message A"
  click_button "Submit"
  click_link "New post"
  fill_in "Message", with: "Message A, displayed above Message B"
  click_button "Submit"
end
