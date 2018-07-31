require 'rails_helper'

RSpec.feature "Session", type: :feature do
  scenario "A user can sign in with valid credentials" do
    user = User.create(email: 'jay@gmail.com', password: "jay123")

    visit "session/new"
    fill_in :email, with: "jay@gmail.com"
    fill_in :password, with: "jay123"
    click_button "Submit"

    expect(page).to have_content("Welcome Jay")
  end
end
