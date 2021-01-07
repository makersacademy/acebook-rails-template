require 'rails_helper'

RSpec.feature 'Editing comments', type: :feature do
  scenario 'Users can edit their own comments' do
    make_comment
    click_link 'Edit comment'
    fill_in 'comment[body]', with: 'This is the updated post!'
    click_button 'Edit'
    expect(page).not_to have_content('Hello, world!')
    expect(page).to have_content('This is the updated post!')
  end

  it 'cant edit comment when not signed in' do
    make_comment
    click_link 'Sign Out'
    click_link 'Timeline'
    expect(page).not_to have_button('Edit Comment')
  end

  it 'cant edit someone elses comment' do
    make_comment
    click_link 'Sign Out'
    user_two
    expect(page).not_to have_button('Edit comment')
  end
end
