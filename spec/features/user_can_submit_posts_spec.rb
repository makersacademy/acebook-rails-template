require 'rails_helper'
require 'helpers/create_post'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    create_post
    expect(page).to have_content("Hello, world!\n This is a post with multiple \n lines")
  end
end
