# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'


RSpec.feature 'Timeline', type: :feature do
  
  scenario 'Can submit posts and view them' do
    sign_up
    visit '/posts'
    click_link 'New Post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Create Post'
    expect(page).to have_content('Hello, world!')
  end  
end