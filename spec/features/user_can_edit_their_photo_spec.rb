require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Users can see their profile picture after making a post" do
    user_sign_up

    click_link "Edit_user"

    expect(page).to have_content("Add avatar")
  end
end
