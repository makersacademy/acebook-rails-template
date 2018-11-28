require 'rails_helper'
require 'timecop'

feature 'update wall post' do

  before do
    sign_up
  end

  scenario 'user can update existing post after creating' do
    fill_in 'Message', with: 'This is a new post'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'Updated post'
    click_button 'Submit'
    expect(page).to_not have_current_path('/posts')
    expect(page).to have_content 'Updated post'
  end
end
