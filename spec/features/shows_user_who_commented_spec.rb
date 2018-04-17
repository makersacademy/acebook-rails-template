require 'rails_helper'

RSpec.feature "Commenting", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "View Comments"
    fill_in "comment[content]", with: "I am comment#1"
    click_button "Create Comment"
  end

  scenario "Can create comment and view immediately" do
    expect(page).to have_content("I am comment#1 - test")
  end

end
