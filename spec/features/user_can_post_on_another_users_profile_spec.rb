require 'rails_helper'

RSpec.feature "Posts on users profile", type: :feature do
  scenario "A user posting on another users profile appears on the second users profile" do
    sign_up_and_sign_in
    make_a_text_post
    click_link("Log Out")
    sign_up_and_sign_in_2
    click_link("Clint Pondsworth")
    make_a_profile_post
    expect(page).to have_content("Not my profile")
  end
end
