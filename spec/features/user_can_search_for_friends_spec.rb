require 'rails_helper'

RSpec.feature "Friends search", type: :feature do
  before :each do
    createUser()
    signin()
  end

  scenario "user can search for friends" do
    visit 'friends/search'
    fill_in 'search', with: "Sam A"
    click_button "submit"
    expect(page).to have_content "Sam Abc"
  end
end

