require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Liking Posts', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end
  describe 'A User' do
    scenario 'Can like comment in posts show' do
      create_post
      click_link 'See Post'
      click_button 'Like'
      click_link "Back"
      expect(page).to have_content('1 Like')
    end

      scenario 'Cant like post more than once' do
        create_post
        click_link 'See Post'
        click_button 'Like'
        click_link "Back"
        click_link 'See Post'
        click_button 'Like'
        expect(page).to have_content('You have already liked this post')
      end

      scenario 'User can unlike a previously liked post' do
        create_post
        click_link 'See Post'
        click_button 'Like'
        click_link "Back"
        click_link 'See Post'
        click_button 'unLike'
        expect(page).to have_content('0 Likes')
      end
    end
  
end