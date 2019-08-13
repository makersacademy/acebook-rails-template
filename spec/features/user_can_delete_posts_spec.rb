require 'rails_helper'
require './spec/helpers/users_helper_spec'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup
    visit ('/posts')
    newpost
    click_button "Remove"
    expect(page).to have_no_content("Hello, world!")
  end
end
