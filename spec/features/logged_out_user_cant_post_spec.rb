require 'rails_helper'

RSpec.feature "Logged out user can't create new post", type: :feature do
  scenario "User visit the page as a guest and try to post" do 
    visit("/") 
    expect(page).not_to have_css("#post_message")
    expect(page).not_to have_selector(:link_or_button, 'Create Post')
  end

end