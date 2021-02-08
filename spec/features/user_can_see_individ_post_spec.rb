require 'rails_helper'

RSpec.feature "Individual Post page", type: :feature do
  scenario "Can see individual posts" do
    visit "/timeline"
    find('.post').click
    expect(page).to have_content("Hello World")
    expect(page).to have_content("@Charlotte")
  end

  scenario "Like post" do
    visit "/timeline"
    find('.post').click
    expect(page).to have_content("0 likes")
    click_on "Like"
    expect(page).to have_content("1 like")
  end
end
