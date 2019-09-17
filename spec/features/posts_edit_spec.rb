require 'rails_helper'
require 'support/features/clearance_helpers'

RSpec.feature 'Post', type: :feature do
  before(:each) do
    sign_in
  end

  scenario 'User can edit his post' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'message before edit'
    click_button 'Submit'
    expect(page).to have_content('message before edit')
    click_link 'Edit'
    fill_in 'Message', with: 'message after edit'
    click_button 'Submit'
    expect(page).to have_content('message after edit')
    expect(page).not_to have_content('message before edit')
  end
end
