require 'rails_helper'

RSpec.feature 'Editing a Post', type: :feature do
  before do
    sign_in_helper
  end

  scenario 'User can visit the edit post page' do
    visit('/')
    create_post('I would like to edit this post')
    click_link('Edit Post')
    expect(page).to have_content('Edit Post')
    expect(page).to have_selector(:link_or_button, 'Update Post')
  end

  scenario 'User can edit a post' do
    visit('/')
    create_post('I would like to edit this post')
    click_link('Edit Post')
    fill_in('post_message', with: 'This is my edited post')
    click_on('Update Post')
    expect(page).to_not have_content('I would like to edit this post')
    expect(page).to have_content('This is my edited post')
    expect(page).to have_content('Your post has been updated')
  end
end
