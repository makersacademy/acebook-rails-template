require 'rails_helper'

RSpec.feature "New User", type: :feature do
  scenario "Can sign up and be directed to posts" do
    visit "/"
    click_link "sign-up"
    fill_in "user[username]", with: "Stephen"
    fill_in "user[email]", with: "stephen@test.com"
    fill_in "user[password]", with: "stephenisntreal"
    click_button "Create Account"
    expect(current_path).to eq("/posts")
  end
end
