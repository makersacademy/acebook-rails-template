require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  before 'sign up and login' do
    create_user
    user_login
  end

  scenario 'Can submit posts and view them' do
    expect(page).to have_content("Make your first post!")
    fill_in 'message_content', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Show the newest post first' do
    visit '/posts'
    fill_in 'message_content', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    fill_in 'message_content', with: 'Hello, acebook-team2!'
    click_button 'Submit'
    expect(Post.order(created_at: :desc)[0].message).to eq('Hello, acebook-team2!')
  end

end
