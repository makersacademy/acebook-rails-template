require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can delete a post" do
    create_user
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).to not_have_content("Hello, world!")
  end


end
