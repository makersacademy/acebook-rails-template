require "rails_helper"
require "web_helper"

RSpec.feature "Hashtags displayed in a list", type: :feature do
  scenario "Hashtags included in posts are detected and displayed" do
    user_sign_up("Andrew")
    submit_test_post("I love working as a team to create awesome products #team #happy")
    submit_test_post("Mondays are great #happy")
    submit_test_post("Watch these PRs roll in #team")
    visit hashtags_path
    expect(page).to have_content("team")
    expect(page).to have_content("happy")
  end
end
