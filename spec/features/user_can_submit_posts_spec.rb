require 'rails_helper'
require 'helpers/create_post'
require 'helpers/create_user'
require 'helpers/user_log_in'

RSpec.feature "Timeline" do
  scenario "Can submit posts and view them" do
    create_user
    user_log_in
    create_post
    expect(page).to have_content("Hello, world!\n This is a post with multiple \n lines")
  end
end
