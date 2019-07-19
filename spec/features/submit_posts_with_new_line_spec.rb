require "rails_helper"

RSpec.feature "Posts written in a text area", type: :feature do
  scenario "User can type posts in a text area " do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "tesymcemail@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    visit "/posts"
    click_link "New post"
    assert_selector "form" do
      assert_selector "textarea"
    end
  end
end
