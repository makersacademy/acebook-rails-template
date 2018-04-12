require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a post" do
    sign_up
    create_post
    click_link "Logout"
    sign_up_user_2
    click_link 'Delete Post'
    expect(page).to have_content("Hello, world!")
  end
end
