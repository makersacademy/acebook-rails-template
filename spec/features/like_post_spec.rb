require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Like posts", type: :feature do
  scenario "User can like a post" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Test message!"
    click_button "Submit"
    158.times{click_button "🐟"}

    expect(page).to have_content(158)
  end
end