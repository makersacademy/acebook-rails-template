require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a post that is not theirs" do
    sign_up
    create_post
    click_link "Logout"
    sign_up_user_2
    expect(page).to_not have_link("Delete Post")
  end
end
