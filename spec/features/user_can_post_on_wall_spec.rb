require 'rails_helper'
require 'timecop'

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
      expect(find('h1.wall-post-title')).to have_content('Write your wall post here')
    end

    scenario 'Can post to someones wall and is redirected back to that profile wall' do
      create_wall_post('A message to my friend')
      expect(first('p.wall-post-message')).to have_content('A message to my friend')
    end

    scenario 'Can see the time when a wall post was posted' do
        Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
        create_wall_post('A message to my friend')
        expect(find('p#1.wallpost-timestamp')).to have_content("Wednesday, 3 Oct 2018 at 1:00 PM")
    end

    scenario 'Can see the sender\'s name on a wall post' do
      create_wall_post('A message to my friend')
      expect(find('div.wall-post-wrapper')).to have_selector('a#1.wall-post-author')
    end

    scenario 'Can delete a wallpost they have posted' do
      create_wall_post('A message to my friend')
      click_on('Delete wall post')
      expect(page).not_to have_content('A message to my friend')
    end
  end
end
