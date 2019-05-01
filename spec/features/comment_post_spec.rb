require 'rails_helper'
require 'sign_up_helper'
require 'sign_in_helper'
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

  feature "Add comment" do
    scenario "User can comment on any post" do
      expect(page).to have_content 'Test adding comment to post'
    end

    scenario "User sees success message on adding comment" do
      expect(page).to have_content 'Salmon had to say it!'
    end
  end

  feature "Edit comment" do
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

    scenario "User cannot edit a different user's comment" do
      click_button 'Sign out'
      first_user_sign_in
      expect(page).to have_no_link 'Edit comment'
    end

    scenario "User sees success message on editing their comment" do
      click_link 'Edit comment'
      fill_in 'comment_body', with: 'I want to see a success message'
      click_button 'Update'
      expect(page).to have_content 'You krill me!'
    end
  end

  feature "Delete comment" do
    scenario "User can delete their comment" do
      click_button 'Delete comment'
      expect(page).not_to have_content 'Test adding comment to post'
    end

    scenario "User cannot delete a different user's comment" do
      click_button 'Sign out'
      first_user_sign_in
      expect(page).to have_no_button 'Delete comment'
    end

    scenario "User sees success message on deleting their comment" do
      click_button 'Delete comment'
      expect(page).to have_content 'That comment is fish-tory'
    end
  end
end
