require "rails_helper"
require "web_helper"

RSpec.feature "Hashtag page shows all tagged with a specific tag", type: :feature do
  before do
    user_sign_up("Sam")
    submit_test_post("I love working as a team to create awesome products #team #happy")
    submit_test_post("Mondays are great #happy")
    submit_test_post("Watch these PRs roll in #team")
  end
  scenario "Posts can be viewed by hashtag" do
    visit hashtags_path
    click_on "team"
    expect(page).to have_content("I love working as a team")
    expect(page).to have_content("Watch these PRs roll in")
    visit hashtags_path
    click_on "happy"
    expect(page).to have_content("I love working as a team")
    expect(page).to have_content("Mondays are great")
  end
  scenario "Hashtags are linkable form posts" do
    visit posts_path
    expect(page).to have_link("#team", href: "/hashtags/team" )
    expect(page).to have_link("#happy", href: "/hashtags/happy" )

  end
end
