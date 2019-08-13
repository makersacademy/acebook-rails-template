require 'rails_helper'

def newpost
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
