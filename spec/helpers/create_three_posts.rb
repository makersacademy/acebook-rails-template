def create_three_posts
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "First post"
  click_button "Submit"
  click_link "New post"
  fill_in "Message", with: "Second post"
  click_button "Submit"
  click_link "New post"
  fill_in "Message", with: "Third post"
  click_button "Submit"
end
