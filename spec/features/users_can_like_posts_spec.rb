require "rails_helper"

RSpec.feature "People can see likes and unlikes", type: :feature, js: true do
  scenario "user logs in and sees posts not liked" do
    seed_post
    sign_up
    expect(page).to have_content "💩"
  end

  scenario "user can change poo emoji to ice cream emoji" do
    seed_post
    sign_up
    expect(page).to have_content "💩"
    click_link "💩"
    expect(page).to have_content "🍦"
  end
end
