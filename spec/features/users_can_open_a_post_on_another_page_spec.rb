require 'rails_helper'
require './spec/helpers/users_helper_spec'

RSpec.feature "Timeline", type: :feature do
  scenario "Can open posts on a new page" do
    signup
    visit ("/posts")
    newpost
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
  end
end
