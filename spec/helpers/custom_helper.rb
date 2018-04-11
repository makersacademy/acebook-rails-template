require 'rails_helper'

def create_post
  visit "/posts"
  click_link "New post"
  fill_in "post[message]", with: "Hello, world!"
  click_button "Throw"
end

def create_comment
  create_post
  fill_in "comment[body]", with: "Hello, Mars!"
  click_button "Comment"
end
