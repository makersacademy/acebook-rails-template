require 'rails_helper'

RSpec.feature 'UserWallPosts', type: :feature do
  pending 'user makes wall post, sees it on their wall'

  it 'user sess wall posts on their wall' do
    user = sign_in
    visit("/users/#{user.id}")
    fill_in(".new-post-form",with: "This is a wall post")
    click_button "post-submit"
    visit("/users/#{user.id}")
    expect(page).to have_content("This is a wall post")
    expect(page).not_to have_content("This is a wall post")
  end

  pending 'user makes wall post on other users wall, sees it on the other users wall'
  pending 'user makes public post, it appears on their wall'
end
