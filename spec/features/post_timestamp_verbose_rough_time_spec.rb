require 'rails_helper'
require 'login_helper'

RSpec.feature "Post timestamp", type: :feature do
  scenario "initially do a new test login" do
    new_login("madname", "mademail@nutter.com", "abc123")
    expect(page.status_code).to eql 200
    expect(page).to have_content("Add a new post")
  end
end
