require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "User can like a post", :upvote do
    sign_up_and_sign_in
    make_a_text_post
    find('img.bubble-logo').click
    expect(page).to have_text '1'
  end

  scenario "User can dislike a post", :downvote do
    sign_up_and_sign_in
    make_a_text_post
    find('img.anchor-logo').click
    expect(page).to have_text '1'
  end
end
