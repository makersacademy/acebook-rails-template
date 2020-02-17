# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can display time on page when post was created' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    actual_time = Post.all[0].created_at.strftime('Posted on %d %B %a %I:%M%p').to_s
    expect(page).to have_content(actual_time)
  end
end
