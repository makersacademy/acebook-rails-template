# # frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "A user can switch their vote on a post" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    click_link 'Badger'
    expect(page).to have_content('0 - 1')
    click_link 'Hedgehog'
    expect(page).to have_content('1 - 0')
    expect(page).not_to have_content('0 - 1')
  end
end
