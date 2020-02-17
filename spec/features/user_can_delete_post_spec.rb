require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view delete button" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_button("Delete")
  end

end
