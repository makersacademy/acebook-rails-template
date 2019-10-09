require 'rails_helper'
require 'test_database_helper'
# require 'controller_macros'

RSpec.feature "Posts show date", type: :feature do
  login_user
  scenario "shows the date" do
    t = Time.now
    populate_test_database("Hello it is Gabriel here")
    visit "/posts"
    expect(page).to have_content(t.strftime(':%M'))
  end
end
