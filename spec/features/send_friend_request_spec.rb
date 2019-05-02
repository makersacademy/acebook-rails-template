# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Send friend request', type: :feature do
  scenario 'from the user profile page' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    expect(current_path).to include('/users')
    expect(page).to have_content("Ahhh! Yoda's little friend you seek!")
  end

  scenario "cannot add yourself as a friend" do
    sign_up
    click_link('My friends')
    expect(page).to_not have_content('Add friend')
  end

  scenario "cannot do two requests" do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    expect(current_path).to include('/users')
    expect(page).not_to have_content("james@test.com Add friend")
    expect(page).to have_content("james@test.com Found someone, you have?")
  end

  scenario "cannot request someone who requested you" do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    click_link('Logout')
    sign_in
    click_link('All Users')
    expect(page).to have_content("tome@test.com View friend request.")
    click_link('View friend request.')
    expect(current_path).to include("/friend_requests")
  end

  scenario "cannot request friends" do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    click_link('Logout')
    sign_in
    click_link('All Users')
    click_link('View friend request.')
    click_link('Accept')
    click_link('Logout')
    sign_in_2
    click_link('All Users')
    expect(page).not_to have_content("james@test.com Add friend")
  end
end
