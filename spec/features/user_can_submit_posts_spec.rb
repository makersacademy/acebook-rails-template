# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    createUser
    signin
  end

  scenario 'Can submit posts and view them' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can edit a post and see it' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'goodbuy'
    click_button 'Submit'
    expect(page).to have_content('goodbuy')
  end

  scenario 'Can add a post and delete it' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end
end
