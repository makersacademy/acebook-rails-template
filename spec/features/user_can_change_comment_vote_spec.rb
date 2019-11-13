# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "A user can switch their vote on a comment" do
    visit('/')
    create_user
    login_user
    create_post
    create_comment
    click_link 'Snake'
    expect(page).to have_content('Snake 1')
    expect(page).to have_content('Rabbit 0')
    click_link 'Rabbit'
    expect(page).to have_content('Snake 0')
    expect(page).to have_content('Rabbit 1')
    expect(page).not_to have_content('Snake 1')
    expect(page).not_to have_content('Rabbit 0')
  end
end
