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

  scenario "user cannot update a wall post that they didn't write" do
    fill_in 'Message', with: 'This is a new post'
    click_button 'Submit'
    log_out
    sign_up_as_second_user
    click_link 'Users'
    click_link 'Amy Smith'
    click_link 'Edit'
    expect(page).to have_content 'You can only edit your own posts'
  end

  scenario "user can only update a wall post within 10 minutes" do
    fill_in 'Message', with: 'This is a new post'
    click_button 'Submit'
    Timecop.travel(Time.now + 11.minutes) do
      click_link 'Edit'
      expect(page).to have_content('You can no longer edit this post')
    end
  end
end
