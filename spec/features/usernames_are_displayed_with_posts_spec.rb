require 'rails_helper'

feature 'Usernames are visible' do
  scenario "with individual posts" do
    signup
    newpost
    expect(page).to have_content("KP")
  end
end
