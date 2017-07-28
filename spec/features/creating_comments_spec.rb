require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can land on comment creation page" do
    create_post
    visit 'comments/new'
    expect(page).to have_content("Comment")
  end
end
