require 'rails_helper'
require 'sign_up_helper'
require 'create_post_helper'

RSpec.feature "Comment posts", type: :feature do

  before(:each) do
    create_user_and_sign_up
    create_post
    click_button 'Sign out'
    create_second_user_and_sign_in
    visit '/posts'
    fill_in 'comment_body', with: 'Test adding comment to post'
    click_button 'Add comment'
  end

  scenario "User can comment on any post" do
    expect(page).to have_content 'Test adding comment to post'
  end

  scenario "User sees success message on adding comment" do
    expect(page).to have_content 'Salmon had to say it!'
  end

  scenario "User can edit their comment" do
    click_link 'Edit comment'
    fill_in 'comment_body', with: 'Updated comment'
    click_button 'Update'
    expect(page).to have_content 'Updated comment'
  end

  scenario "User cannot edit their comment after 10 minutes" do
    Timecop.travel(Time.now + 11.minutes) do
      visit '/posts'
      expect(page).to have_no_link 'Edit comment'
    end
  end
end
