require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  it 'should be able to delete a post' do
    register_user
    creating_post('Testing Deleting Posts!')

    within all('.posts').last do
      click_button('Delete post')       
    end

    expect(page).not_to have_content('Testing Deleting Posts!')
  end

  it 'user should only be able to delete own post' do
    register_user
    creating_post('Deleting Own Post!')

    register_user('test2@test.com')
    visit '/posts'

    expect(page).not_to have_selector(:link_or_button, 'Delete post')
  end
end