def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hi"
  click_button "Submit"
end

def create_post_multi_line
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Line one \nLine Two"
  click_button "Submit"
end

def update_post
  visit '/posts'
  click_on "Edit"
  fill_in "post[message]", with: "Bye"
  click_on "Update Post"
end
