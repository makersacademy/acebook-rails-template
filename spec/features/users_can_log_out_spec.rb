# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Log out", type: :feature do
  scenario "Log out should not appear if user is not logged in" do
    visit "/"
    expect(page).not_to have_link("Log out")
  end

  scenario "Clicking log out should log you out" do
    sign_up
    click_link("Log out")
    expect(page).not_to have_link("Log out")
  end
end
