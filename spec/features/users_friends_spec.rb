require 'rails_helper'

RSpec.feature 'Friends', type: :feature do
  scenario 'A signed up user can add a friend' do
    register
    submit_post
    click_link 'Sign out'
    register_second_user
    click_link 'Katy Day'
    click_link 'Be my friend'
    expect(page).not_to have_link('Be my friend')
  end

  scenario "A signed up user once they have added a friend can see their name in friends list" do
    friend_request
    click_link 'Accept Friend Request'
    click_link 'Profile'
    click_link 'Friend list'
    expect(page).to have_content("Katy Day's friends")
    expect(page).to have_link("John Smith")
  end

  scenario "A signed up user can decline a friend request from another signed up user" do
    friend_request
    click_link 'Decline Friend Request'
    click_link 'Profile'
    click_link 'Friend list'
    expect(page).to have_content("Katy Day's friends")
    expect(page).not_to have_link("John Smith")
  end

  scenario "A signed up user can view another signed up users friends list on their profile" do
    friend_request
    click_link 'Accept Friend Request'
    click_link 'Sign out'
    click_link 'Sign in'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'
    click_link 'Katy Day'
    click_link 'Friend list'
    expect(page).to have_link('John Smith')
  end
end
