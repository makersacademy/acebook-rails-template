require 'rails_helper'

RSpec.feature "Unliking", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "View Comments"
  end

  scenario "User can ony like post once" do
    click_button 'Like'
    click_button 'Unlike'
    expect(page).to have_content("0 Likes")
  end
end
