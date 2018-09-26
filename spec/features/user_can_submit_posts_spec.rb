require 'rails_helper'
require 'web_helper'

RSpec.feature "New Posts", type: :feature do
  scenario "user can post message" do
    submit_test_post
    expect(page).to have_content("test post")
  end

end
