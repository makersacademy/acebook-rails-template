require 'rails_helper'
require 'features_helper'

RSpec.feature "Like", type: :feature do
  scenario "user can 'like' a post" do
    signup
    login
    create_post
    click_button "Like"
    expect(page).to have_content("1 Like")
  end

  scenario "user can 'unlike' a post" do
    signup
    login
    create_post
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_content("0 Likes")
  end
end