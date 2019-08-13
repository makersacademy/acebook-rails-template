require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "Can sign up" do
    visit "/"
    fill_in "username", with: "Bobby"
    fill_in "password", with: "123"
    click_button "Submit"
    expect(page).to have_content("Welcome Bobby")
  end
end
