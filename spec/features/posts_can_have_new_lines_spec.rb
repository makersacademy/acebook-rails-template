require 'rails_helper'

RSpec.feature "Posts with new lines", type: :feature do
  scenario "User creates a multi line post" do
    user_sign_up

    click_link "New post"
    fill_in "Message", with: "Hello\rHello it's me"
    click_button "Submit"

    expect(page).to have_content("Hello")
    expect(page).to have_content("Hello it's me")
  end
end
