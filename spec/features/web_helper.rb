
def add_new_post
  visit "/posts"
  click_link "New post"
  fill_in "Post a new message", with: "Hello, world!"
  click_button "Submit"
end

def add_comment
  click_link "Show"
  fill_in "comment[commenter]", with: "Charlene"
  fill_in "comment[body]", with: "Rails is awesome!"
  click_button "Create Comment"
end
