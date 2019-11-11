# frozen_string_literal: true 
require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "Can downvote posts" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Badger'
    expect(page).to have_content('Hedgehog 0')
    expect(page).to have_content('Badger 1')
  end

  scenario "A user cannot add more than one downvote to a post" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Badger'
    click_link 'Badger'
    expect(page).to have_content('Hedgehog 0')
    expect(page).to have_content('Badger 1')
  end
end