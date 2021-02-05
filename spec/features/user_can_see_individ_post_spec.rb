require 'rails_helper'

RSpec.feature "Individual Post page", type: :feature do
  scenario "Can see individual posts" do
    visit "/timeline"
    find('.post').click
    expect(page).to have_content("Hello World")
    expect(page).to have_content("Charlotte")
  end
end
