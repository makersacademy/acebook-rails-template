def visit_home_create_post
  visit "/"
  click_link "New Post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
  click_link "Hello, world!"
  expect(page).to have_content("Hello, world!")
end