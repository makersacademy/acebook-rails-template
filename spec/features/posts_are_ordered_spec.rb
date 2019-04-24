require 'rails_helper'

RSpec.feature 'Posts are ordered', type: :feature do
  scenario 'Posts are ordered by newest first' do

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Last"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "First"
    click_button "Submit"
    visit "/posts"

    expect(page.body.index("First")).to be < page.body.index("Last")
  end
end
