require 'rails_helper'

RSpec.feature "Restricted site access if logged out", type: :feature do
  scenario "users who aren't signed in will visit get redirected to login" do
    visit "/posts"
    expect(page).to have_current_path sessions_new_path
  end
end
