def submit_test_post
  visit "/posts/new"
  fill_in "content", with: "test post"
  click_button "submit"
end
