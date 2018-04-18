require 'rails_helper'

RSpec.feature "Adding a photo", type: :feature do

  before(:each) do
    sign_up
  end

  scenario "User can post an image and see it" do
    click_link "New post"
    attach_file('post[image]', "spec/images/wow.png")
    fill_in "Message", with: "wow"
    click_button "Submit"
    expect(page).to have_content("wow")
    expect(page).to have_css("img[src*='wow.png']")
  end
end
