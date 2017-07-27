require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Can see a like link next to posts" do
    create_post
    expect(page).to have_content("Like")
  end
  scenario "Gets redirected to new like page" do
    create_post
    click_link "Like"
    expect(current_path).to eq ("/likes/new")
  end
end
