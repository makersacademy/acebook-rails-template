require 'rails_helper'

RSpec.feature 'Posts are ordered', type: :feature do
  scenario 'Posts are ordered by newest first' do

    sign_up

    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "First post"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "Second post"
    click_button "Submit"
    visit "/posts"

    expect(page.body.index("Second post")).to be < page.body.index("First post")
  end
end
