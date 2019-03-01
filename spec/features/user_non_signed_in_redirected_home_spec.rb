require 'rails_helper'

RSpec.feature "User journeys", type: :feature do
  scenario "User cannot see /posts unless he is signed in" do
    visit "/posts"
    expect(page).to have_current_path("/")
  end
end
