require "rails_helper"
require 'pry'

def post_comment
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: "opinionatedtroll@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Submit"
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "No!"
  click_button "Submit"
  click_link "Comment"
  find_link("Show Comments (0)", visible: false).click
  find_link("New Comment", visible: false).click
  find("textarea#comment_body", visible: false).set("I disagree.")
  find_button("Post Comment").click
end
