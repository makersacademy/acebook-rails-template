require 'rails_helper'
require 'helpers/user_log_in'
def create_post
  User.create(id: 4, name: 'matt', email:'new_user@email.com', password: 'Password123')
  fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
  click_button "Submit"
end
