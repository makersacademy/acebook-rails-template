# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  before(:each) do
    successful_sign_up
  end

  scenario 'Can submit posts and view them' do
    new_post_and_submit('Hello, world!')
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can add posts with newlines' do
    new_post_and_submit("Hello\nNewLine here")
    expect(page).to have_content("Hello\nNewLine here")
  end

  scenario 'Post has a time stamp' do
    t = Time.now.utc
    time = t.strftime('%H:%M %Y-%m-%d')
    new_post_and_submit('time stamp')
    expect(page).to have_content('time stamp')
    expect(page).to have_content(time)
  end

  scenario 'Posts are shown latest first' do
    new_post_and_submit('Old Message')
    new_post_and_submit('New Message')
    expect('New Message').to appear_before('Old Message')
  end
end
