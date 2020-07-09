# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  it 'Can submit posts and view them' do
    log_in_eman
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'New Post'
    expect(page).to have_content('Hello, world!')
  end

  it 'Can submit a post and present a date and time' do
    log_in_eman
    click_link 'New post'
    fill_in 'Message', with: 'Whats the time?'
    click_button 'New Post'
    expect(page).to have_content(Time.now.strftime('%B %d %Y').to_s)
  end

  it 'Post can be added with line breaks' do
    log_in_eman
    click_link 'New post'
    fill_in 'Message', with: 'line' + "\r\n" + 'break!'
    click_button 'New Post'
    expect(page).to have_content("line\nbreak!")
  end
end
