require 'rails_helper'

RSpec.feature 'User profile', type: :feature do
  scenario 'user can sign out successfully' do
    sign_in_as_user
    click_link 'Profile'
    expect(page).to have_content 'Alice Bobson'
  end

  scenario "user can view another user's profile" do
    user = create(:user)
    login_as(user, scope: :user)
    id = user.id

    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'

    click_link 'Sign Out'
    user2 = create(:user)
    login_as(user2, scope: :user)
    visit '/posts'
    click_link 'Alice Bobson'
    expect(page).to have_current_path("/users/#{id}")
  end
end
