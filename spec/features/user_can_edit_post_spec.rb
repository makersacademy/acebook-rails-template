require 'rails_helper'
require 'timecop'

RSpec.feature 'Editing a Post', type: :feature do
  before do
    sign_up_correct_helper
    visit('/')
    Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
    create_post('I would like to edit this post')
  end

  scenario 'User can visit the edit post page' do
    Timecop.freeze(Time.zone.parse('13:05 3 October 2018'))
    visit('/')
    click_link('Edit Post')
    expect(page).to have_content('Edit Post')
    expect(page).to have_selector(:link_or_button, 'Update Post')
  end

  scenario 'User can edit a post' do
    Timecop.freeze(Time.zone.parse('13:05 3 October 2018'))
    visit('/')
    click_link('Edit Post')
    fill_in('post_message', with: 'This is my edited post')
    click_on('Update Post')
    expect(page).to_not have_content('I would like to edit this post')
    expect(page).to have_content('This is my edited post')
    expect(page).to have_content('Your post has been updated')
  end

  scenario 'User cannot edit a post if it is older than 10 mins' do
    Timecop.freeze(Time.zone.parse('13:15 3 October 2018'))
    visit('/')
    expect(page).not_to have_selector(:link_or_button, 'Edit Post')
  end
end
