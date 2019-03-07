require 'rails_helper'
require 'web_helper'

RSpec.feature "Users are redirected to own wall", type: :feature do
  scenario "when logging in" do
    log_in
    expect(page).to have_content("Bob's wall")
  end
end
