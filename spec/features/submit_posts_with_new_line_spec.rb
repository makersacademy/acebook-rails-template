require "rails_helper"

RSpec.feature "Posts written in a text area", type: :feature do
  scenario "User can type posts in a text area " do
    visit "/posts"
    click_link "New post"
    assert_selector "form" do
      assert_selector "textarea"
    end
  end
end
