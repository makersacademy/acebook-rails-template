require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Timeline', type: :feature do


  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

describe 'A User' do
  scenario 'Can edit post' do
    # sign_up_with('username', 'test@mail.com', 'testing')
    # sign_in_with('test@mail.com', 'testing')
    visit '/posts'
    click_link 'add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    click_link 'Edit'
    fill_in 'post[message]', with: 'Hello, world again!'
    click_button 'Update Post'
    expect(page).to have_content('Hello, world again!')
  end

  scenario 'A user Can delete post' do
    # sign_up_with('username', 'test@mail.com', 'testing')
    # sign_in_with('test@mail.com', 'testing')
    visit '/posts'
    click_link 'add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    click_link 'Delete'
    expect(page).to_not have_content('Hello, world!')
  end
end

  scenario "A diffente user can't delete other's posts" do
    visit '/posts'
    click_link 'add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    sign_out
    click_link 'Sign up'
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    click_link 'posts'
    visit "/posts"
    expect(page).not_to have_button("Delete")
  end 

end
