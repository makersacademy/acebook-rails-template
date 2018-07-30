require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, coppers!\bDid you miss me?"
    click_button "Submit"
    # expect(page).to have_content("Hello, world!\bDid you miss me?")
    expect(page).to have_css('p', text: 'Hello, coppers!')
    expect(page).to have_css('p', text: 'Did you miss me?')
  end
end
