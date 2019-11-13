# # frozen_string_literal: true

# require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "A user can switch their vote on a post" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Badger'
    expect(page).to have_content('Badger 1')
    expect(page).to have_content('Hedgehog 0')
    click_link 'Hedgehog'
    expect(page).to have_content('Badger 0')
    expect(page).to have_content('Hedgehog 1')
    expect(page).not_to have_content('Badger 1')
    expect(page).not_to have_content('Hedgehog 0')
  end
end
