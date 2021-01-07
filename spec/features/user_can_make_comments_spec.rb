require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  it 'Can submit comments and view them' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'this is a post'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is a comment'
    click_button 'Add Comment'
    expect(page).to have_content('this is a comment')
  end

  it 'cant make a comment when not signed in' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'this is a post'
    click_button 'Submit'
    click_link 'Sign Out'
    click_link 'Timeline'
    expect(page).not_to have_button('Add Comment')
  end
end
