require 'rails_helper'

RSpec.feature 'Profile page', type: :feature do
  before(:each) do
    sign_up_correct_helper
    create_post('Hello!')
  end

  context 'User visits their profile' do
    before do
      visit '/1'
    end

    scenario 'Their name is displayed' do
      expect(find('#user-name-title')).to have_content('TestName')
    end

    scenario 'They see their own posts' do
      expect(find('#1.post-message')).to have_content 'Hello!'
    end

    scenario 'posts appear in reverse chronological order' do
      Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
      create_post('First post')
      Timecop.freeze(Time.zone.parse('14:00 3 October 2018'))
      create_post('Second post')
      expect(first('.post-message')).to have_content 'Second post'
    end

    scenario "user visits another profile and can see only that user's posts" do
      click_on('Logout')
      sign_up_helper('bob@bob.com', 'Bob', 'password')
      create_post('Goodbye!')
      visit '/1'
      expect(page).not_to have_content 'Goodbye!'
      expect(page).to have_content 'Hello!'
    end
  end

  context 'Navigation' do
    scenario 'User can visit own profile by clicking on profile button (in timeline)' do
      click_on('My Profile')
      expect(page).to have_current_path('/1')
    end

    scenario 'User can go back to timeline from profile by clicking Home' do
      visit('/1')
      click_on('Home')
      expect(page).to have_current_path('/')
    end

    scenario 'User can click on authors name for post to visit their profile' do
      click_on('Logout')
      sign_up_helper('seconduser@test.com', 'andres', 'password')
      click_on('Home')
      click_on('TestName')
      expect(page).to have_current_path('/1')
    end
  end

  context 'Routes' do
    # scenario 'URL set to name', focus: true do
    #   click_on('My Profile')
    #   expect(page).to have_current_path('/TestName')
    # end
  end
end
