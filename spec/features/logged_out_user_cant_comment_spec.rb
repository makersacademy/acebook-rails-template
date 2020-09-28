require 'rails_helper'

RSpec.feature "Logged out user can't comment", type: :feature do
  scenario "User visit the page as a guest and try to write new comment" do 
    visit("/")
   
    expect(page).not_to have_css("#comment_comment")
    expect(page).not_to have_selector(:link_or_button, 'Create Comment')
  end

end