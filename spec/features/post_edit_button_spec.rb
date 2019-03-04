require 'rails_helper'
require 'web_helper'

RSpec.feature "Edit button", type: :feature do
  scenario "posts have an edit button" do
    log_in
    expect(page).to have_button("Edit")
  end
end
