require 'rails_helper'
require 'create_three_posts'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts appear in reverse order" do
    create_three_posts
    expect(page).to have_selector("ul li:nth-child(1)", text: "Third post")
    expect(page).to have_selector("ul li:nth-child(3)", text: "First post")
  end
end
