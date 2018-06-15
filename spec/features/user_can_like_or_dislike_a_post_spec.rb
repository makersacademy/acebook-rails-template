require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "User can like a post", :upvote do
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    expect(page).to have_text '1'
  end

  scenario "User can unlike a post", :upvote do
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    expect(page).to have_text '0'
  end

  scenario "User can dislike a post", :downvote do
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    expect(page).to have_text '1'
  end

  scenario "User can undislike a post", :downvote do
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    expect(page).to have_text '1'
  end
end
