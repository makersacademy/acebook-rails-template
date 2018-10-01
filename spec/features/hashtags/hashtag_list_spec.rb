require "rails_helper"
require "web_helper"

RSpec.feature "Hashtags displayed in a list", type: :feature do
  before do
    user_sign_up("Phil")
    submit_test_post("I love working as a team to create awesome products #team #happy")
    submit_test_post("Mondays are great #happy #mondays")
    submit_test_post("Watch these PRs roll in #team")
    submit_test_post("New CSS is looking great #happy")
    click_on "Trending"
  end

  scenario "Hashtags included in posts are detected and displayed" do
    expect(page).to have_content("team")
    expect(page).to have_content("happy")
  end

  scenario "Hashtags on the trending page are shown in order of number of times used" do
    expect(page.text).to match(/.*happy \(3\).*team \(2\).*mondays \(1\)/)
  end
end
