# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "A user can switch their vote on a comment" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    create_comment
    click_link 'Snake'
    expect(page).to have_content('0 - 1')
    click_link 'Rabbit'
    expect(page).to have_content('1 - 0')
    expect(page).not_to have_content('0 - 1')
  end
end
