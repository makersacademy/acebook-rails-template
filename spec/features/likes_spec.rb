require 'rails_helper'

RSpec.feature "Commenting", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "View Comments"
    fill_in "comment[content]", with: "I am comment#1"
    click_button "Create Comment"
  end

  scenario "Can like post and view immediately" do
    click_button 'Like'
    expect(page).to have_content("1")
  end

end
