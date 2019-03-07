require 'rails_helper'

RSpec.feature "Profile page", type: :feature do
  scenario "can see their profile page with posts" do
    login_george_manyposts
    expect(page).to have_content('Logged in')
    click_link('George Manyposts', match: :first)
    expect(page).to have_content("George Manyposts")
    expect(page).to have_content("A medium length post of a single sentence of an average length. Number 2")
    visit "/users/2"
    expect(page).to have_content("Percy Onepost")
    expect(page).to have_content("A medium length post of a single sentence of an average length")
  end

  scenario "can click on a different user's profile" do
    login_george_manyposts
    expect(page).to have_content('Logged in')
    click_link('Percy Onepost')
    expect(page).to have_content("Percy Onepost's Profile")
  end

end
