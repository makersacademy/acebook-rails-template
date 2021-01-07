require 'rails_helper'

RSpec.feature 'Adding friends', type: :feature do
  scenario 'Can\'t see add friend button when not signed in' do
    register_u1_and_create_post
    click_link 'Sign Out'
    click_link 'Timeline'
    click_link 'Test123'
    expect(page).to have_content "Test123's profile page"
    expect(page).not_to have_link('Add as friend')
  end

  scenario 'Can\'t see add friend button for self' do
    register
    click_link 'Profile'
    expect(page).to have_content "Test123's profile page"
    expect(page).not_to have_link('Add as friend')
  end

  scenario 'Can see add friend button for other user, when no request has been sent' do
    register_u1_and_create_post
    click_link 'Sign Out'
    user_two
    click_link 'Timeline'
    click_link 'Test123'
    expect(page).to have_content "Test123's profile page"
    expect(page).to have_link('Add as friend')
  end

  scenario 'After clicking add friend button, it is no longer visible and replaced with a message' do
    register_u1_and_create_post
    click_link 'Sign Out'
    user_two
    click_link 'Timeline'
    click_link 'Test123'
    expect(page).to have_content "Test123's profile page"
    click_link 'Add as friend'
    expect(page).to have_content "Test123's profile page"
    expect(page).not_to have_link('Add as friend')
    expect(page).to have_content "You are waiting for Test123 to respond to your friend request"
  end

  scenario 'When another user has sent a friend request, the add friend button is no loger visible on their page and replaced with a message' do
    register_u1_and_create_post
    click_link 'Sign Out'
    register_u2_and_create_post
    click_link 'Timeline'
    click_link 'Test123'
    click_link 'Add as friend'
    click_link 'Sign Out'
    sign_in
    click_link 'Timeline'
    click_link 'Testy123'
    expect(page).to have_content "Testy123's profile page"
    expect(page).not_to have_link('Add as friend')
    expect(page).to have_content "Testy123 is waiting for you to respond to their"
    expect(page).to have_link('friend request')
  end
end


# further tests:
# cant see add friend button when friend
# after rejecting a friend request can see buttton again
