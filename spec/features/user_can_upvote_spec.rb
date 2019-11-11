# frozen_string_literal: true 
require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "Can upvote posts" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Hedgehog'
    expect(page).to have_content('Hedgehog 1')
    expect(page).to have_content('Badger 0')
  end

  scenario "A user cannot add more than one upvote to a post" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Hedgehog'
    click_link 'Hedgehog'
    expect(page).to have_content('Hedgehog 1')
    expect(page).to have_content('Badger 0')
  end
end