require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Timeline', type: :feature do


  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

describe 'A User' do
  scenario 'Can edit post' do
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    click_link 'Edit'
    fill_in 'post[message]', with: 'Hello, world again!'
    click_button 'Update Post'
    expect(page).to have_content('Hello, world again!')
  end

  scenario 'A user Can delete post' do
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    click_link 'Delete'
    expect(page).to_not have_content('Hello, world!')
  end
end

  scenario "A diffent user can't delete other's posts" do
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    sign_out
    click_link 'Sign up'
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    click_link 'See all posts'
    visit "/posts"
    expect(page).not_to have_button("Delete")
  end 

  scenario "A diffent user can't edit other's posts" do
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    sign_out
    click_link 'Sign up'
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    click_link 'See all posts'
    visit "/posts"
    expect(page).not_to have_button("Edit")
  end 

  scenario 'can have the time the post was created ' do
    visit '/posts'
    click_link 'Add new post'
    text = 'This is a new post'
    fill_in 'Message', with: text
    click_button 'Submit'
    t = DateTime.now
    expect(page).to have_text(t.strftime("Posted: %d/%m/%Y"))
  end

  # scenario 'User can upload an avatar as a profile picture'
  #   visit '/'
  #   click_link
end
