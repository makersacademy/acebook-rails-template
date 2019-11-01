# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'posts includes time in which created' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content(Time.now.utc)
  end

  scenario 'New line in post' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: "Bye, \n world!"
    click_button 'Submit'
    expect('Bye').to appear_before('br').appear_before('world!')
  end
end
