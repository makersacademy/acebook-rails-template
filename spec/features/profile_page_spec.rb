# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'can see profile link', type: :feature do
  scenario 'link takes you to a users profile' do
    sign_up
    click_link 'Profile'
    expect(page).to have_content "Tom's Profile"
  end
end

RSpec.feature 'can see posts', type: :feature do
  scenario 'only the users posts are shown on a profile page' do
    sign_up
    add_new_post
    sign_out
    sign_up_second_user
    second_user_add_post
    sign_out
    sign_in
    click_link 'Profile'
    expect(page).to have_content 'Hello, world!'
    expect(page).not_to have_content 'Makers Academy is awesome'
  end
end
