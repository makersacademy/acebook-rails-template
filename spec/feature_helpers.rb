def visit_page_and_post
  visit "/posts"
  click_link "New post"
  fill_in "Content", with: "Hello, world!"
  click_button "Submit"
end