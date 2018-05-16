require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "User can like posts" do
    signup_and_login
    create_dummy_post
    click_link "Like"
    expect(page).to have_content("Unlike")
  end
end
