require 'rails_helper'
require 'timecop'

feature 'update wall post' do

  before do
    sign_up
    create_post
  end

  scenario 'user can update existing post after creating' do
    click_link 'Edit'
    fill_in 'Message', with: 'Updated post'
    click_button 'Submit'
    expect(page).to_not have_current_path('/posts')
    expect(page).to have_content 'Updated post'
  end
end
