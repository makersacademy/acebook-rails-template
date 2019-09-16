require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Update post", type: :feature do
  before do
    Timecop.freeze(Time.local(2019, 9, 13, 10, 0, 0))
  end

  scenario "User CANNOT update post after ten minutes of creation" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    Timecop.travel(Time.local(2019, 9, 13, 10, 15, 1))
    visit current_path
    expect(page).not_to have_selector(:link_or_button, "Update")
  end

  scenario "User CAN update before ten minutes of creation" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_selector(:link_or_button, "Update")
  end
end
