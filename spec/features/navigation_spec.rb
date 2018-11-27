require 'rails_helper'
require 'web_helper'

RSpec.feature "Navigation bar", type: :feature do
  scenario "Can sign up and then sign out" do
    signup
    click_link "Sign Out"
    expect(page).to_not have_content('New Post')
    expect(page).to_not have_content('News Feed')
    expect(page).to_not have_content('My Wall')
  end

  scenario "Can see the News Feed" do
    signup
    click_link "News Feed"
    expect(page).to have_content("Newsfeed")
  end
end
