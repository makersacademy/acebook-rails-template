require 'rails_helper'

RSpec.describe "Like and unlike features" do
  scenario "I can like a post and see the number of likes increasing" do
    log_in_test_user_1
    expect(page).not_to have_content("1 Like")
    click_on("Like", match: :first)
    expect(page).to have_content("1 Like")
  end

  scenario "I can unlike a post and see the number of likes descreasing" do
    log_in_test_user_1
    click_on("Like", match: :first)
    expect(page).to have_content("1 Like")
    click_on("Unlike", match: :first)
    expect(page).not_to have_content("1 Like")
  end
end
