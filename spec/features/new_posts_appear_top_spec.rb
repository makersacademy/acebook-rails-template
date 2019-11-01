# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'New posts', type: :feature do
  scenario 'New Posts appear  first' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'Bye, world!'
    click_button 'Submit'
    expect('Bye, world!').to appear_before('Hello, world!')
  end
end
