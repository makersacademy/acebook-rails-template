require 'rails_helper'

def create_post
  fill_in "post[message]", with: "Hello, world!"
  click_button "Create Post"
end

