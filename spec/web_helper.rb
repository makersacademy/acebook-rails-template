def submit_test_post
  visit "/posts/new"
  fill_in :post_content, with: "test post"
  click_on "Create Post"
end
