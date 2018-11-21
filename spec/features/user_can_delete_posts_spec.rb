require 'rails_helper'

RSpec.feature "Deleting posts", type: :feature do
  before do
    signup1
  end

  scenario "User can delete their own post" do
    post_message("Hello, world!")
    click_link("Hello, world!")
    click_button 'Delete'
    expect(page).not_to have_content("Hello, world!")
  end

end
