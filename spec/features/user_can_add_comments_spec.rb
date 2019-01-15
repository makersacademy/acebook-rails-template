# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before :each do
    createUser
    signin
    postMessage
  end

  scenario 'Can leave a comment on a post and view them' do
    first('.comment').click
    fill_in 'comment_content', with: 'Test comment'
    click_button 'Submit'
    expect(page).to have_content 'Test comment'
  end

  scenario 'Can edit a comment' do
    addFriend
    first('.comment').click
    fill_in 'comment_content', with: 'Test comment'
    click_button 'Submit'
    all('a', text: 'Edit')[1].click
    fill_in 'comment_content', with: 'Changed comment'
    click_button 'Submit'
    expect(page).to have_content 'Changed comment'
  end

  scenario 'Can delete a comment' do
    addFriend
    all('a', text: 'Delete')[0].click
    expect(page).not_to have_content 'this_is_a_new_comment'
  end

  scenario "Can't edit/delete someone else's comments" do
    signout
    createUser(email: 'new@test.com')
    signin(email: 'new@test.com', password: 'hello2')
    expect(page).not_to have_content 'Edit'
    expect(page).not_to have_content 'Delete'
  end 

  scenario "Can delete another person's comment on own post" do
    signout
    expect(page).to have_content('sign in')
    createUser(email: 'hello@mail.com', firstname: 'John')
    signin(email: 'hello@mail.com')
    addFriend
    click_link 'Comment'
    fill_in 'comment_content', with: 'Test comment'
    click_button 'Submit'
    signout
    signin
    expect(page).to have_content 'Test comment'
    all('a', text: 'Delete')[1].click
    expect(page).not_to have_content 'Test comment'
  end
end
