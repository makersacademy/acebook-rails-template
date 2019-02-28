require 'rails_helper'

RSpec.feature "Display Posts", type: :feature do
  scenario "Can view posts arranged newest first" do
    log_in
    expect(page).to have_selector("ul#posts li:nth-child(1)", text: "Huzzah!")
    expect(page).to have_selector("ul#posts li:nth-child(2)", text: "Huzzay!")
    expect(page).to have_selector("ul#posts li:nth-child(3)", text: "Hello World")
  end
end
