require_relative 'clearance_helpers.rb'

def creates_a_post
  sign_up_with('bob@email.com', 'password1', 'bob1')
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def creates_a_post2
  click_link "New post"
  fill_in "Message", with: "Hello, again"
  click_button "Submit"
end
