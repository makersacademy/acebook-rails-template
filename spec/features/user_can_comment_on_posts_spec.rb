# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  before do
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'Email', with: 'tansaku@gmail.com'
    fill_in 'Password', with: '12345678m'
    fill_in 'Password confirmation', with: '12345678m'
    # user = User.create email: 'tansaku@gmail.com', password: '12345678',
    # password_confirmation: '12345678'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'post_message', with: "my first post"
    click_button 'Submit'
  end
  scenario 'Can comment on a post' do
    visit '/posts'
    fill_in 'comment[content]', with: 'my first comment!'
    click_button 'Comment'
    expect(page).to have_content('my first comment!')
  end


end
