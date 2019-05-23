require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    visit "/sessions/new"
    expect(page).to have_content("Log in")
  end
end

RSpec.feature "UsersLogins", type: :feature do
  scenario "login with invlaid information" do
    visit '/sessions/new'
    expect(page).to have_content 'New bear?'
    click_on 'Log in'
    expect(page).to have_content 'Invalid email/password combination'
    visit '/users/new'
    visit '/sessions/new'
    expect(page).not_to have_content 'Invalid email/password combination'
  end
end
