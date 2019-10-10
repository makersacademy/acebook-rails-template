require 'rails_helper'
require 'feature_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Cannot delete another person's post" do
    register
    post_something
    click_button "Sign out"
    register_2
    click_link "Delete"
    expect(page).to have_content("Cannot delete other members' posts!!")
  end

  scenario "Cannot edit another person's post" do
    register
    post_something
    click_button "Sign out"
    register_2
    click_link "Delete"
    expect(page).to have_content("Cannot edit other members' posts!!")
  end
end
