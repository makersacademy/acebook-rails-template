require 'rails_helper'

RSpec.feature 'profile page', type: :feature do
  scenario 'A user can visit thier own profile page' do
    register
    click_link 'Profile'
    expect(page).to have_content('Katy Day')
  end

  scenario 'A user can see only thier own posts on thier profile page' do
    register
    submit_post
    click_link "Sign out"
    register_second_user
    click_link 'Profile'
    expect(page).to have_content('John Smith')
    expect(page).not_to have_content('Katy Day')
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'A signed-in user can access another user profile via their posts' do
    register
    submit_post
    click_link "Sign out"
    register_second_user
    click_link 'Katy Day'
    expect(page).to have_content('Katy Day')
    expect(page).to have_content('Hello, world!')
  end

  scenario "A non-signed in user can't access a profile" do
    register
    submit_post
    click_link 'Sign out'
    click_link 'Katy Day'
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content('Log in')
  end

  scenario "A user can delete their post on another users page" do
    friend_request
    click_link "Accept Friend Request"
    click_link 'Profile'
    click_link 'Friend list'
    click_link 'John Smith'
    click_link 'Post on wall'
    fill_in 'Message', with: 'Hello from Katy'
    click_button 'Post'
    click_link "Delete post"
    expect(page).not_to have_content('Hello from Katy')
  end

  scenario "When a user visits a profile the url includes the profile user's username" do
    register
    click_link "Profile"
    expect(page).to have_current_path("/users/katy_the_magnificent")
  end

  scenario "When a user visits a user profile that doesnt exist it shows a custom 404 page" do
    register
    visit ('/users/katy_not_so_magnificent')
    expect(page).to have_content('User not found')
  end

end
