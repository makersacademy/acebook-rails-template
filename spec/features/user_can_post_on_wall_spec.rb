require 'rails_helper'

RSpec.feature 'Profile page', type: :feature do
  before(:each) do
    sign_up_correct_helper
    visit '/profile'
  end

  context 'A signed in user' do
    scenario 'Can see a link to post on a user\'s wall' do
      expect(page).to have_selector(:link_or_button, 'Post to this wall')
    end

    scenario 'Can click on link and view new wall post form' do
      click_on('Post to this wall')
      expect(page).to have_content('Write your post here')
    end

    scenario 'Can post to someones wall and is redirected back to the profile wall' do
      create_wall_post('A message to my friend')
      expect(page).to have_content('A message to my friend')
    end
  end
end
