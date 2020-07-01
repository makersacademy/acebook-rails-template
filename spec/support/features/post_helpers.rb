def creates_a_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def creates_a_post2
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, again"
  click_button "Submit"
end
