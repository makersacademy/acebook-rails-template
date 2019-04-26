# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Log out", type: :feature do
  scenario "Clicking log out should log you out" do
    sign_up
    click_link("Log out")
    expect(page).not_to have_link("Log out")
    expect(page).to have_text("You are logged out")
  end
end
