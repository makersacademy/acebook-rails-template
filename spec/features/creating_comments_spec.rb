require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "A comment can be created" do
    create_post
    visit 'comments/new'
    expect(page).to have_content("Comment")
  end
end
