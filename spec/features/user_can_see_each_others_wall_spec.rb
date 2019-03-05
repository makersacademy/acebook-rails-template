require 'rails_helper'
require 'web_helper'

RSpec.feature "Wall", type: :feature do
  scenario "Can see each other's walls" do
    sign_up
    visit "#{User.first.id}"
    expect(page).to have_content("Bob's wall")
    visit "#{User.first.id + 1}"
    expect(page).to have_content("Jane's wall")
    visit "#{User.last.id}"
    expect(page).to have_content("Test's wall")
  end

  scenario "You only see posts that should be on Bob's wall on Bob's wall" do
    sign_up
    visit "#{User.first.id}"
    expect(page).not_to have_content("Huzzah!")
    expect(page).to have_content("Hello World")
  end
end
