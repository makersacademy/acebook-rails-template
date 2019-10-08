require 'rails_helper'
require 'test_database_helper'

RSpec.feature "Posts show date", type: :feature do
  scenario "shows the date" do
    t = Time.now
    populate_test_database("Hello it is Gabriel here")
    visit "/posts"
    expect(page.find('p:nth-child(3)')).to have_content(t.strftime(':%M'))
  end
end
