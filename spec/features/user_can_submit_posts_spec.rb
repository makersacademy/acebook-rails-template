# frozen_string_literal: true

require 'rails_helper'
include WelcomeHelper

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'You can see the time the post was created' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content(Date.today.strftime('%d/%m/%y'))
  end

  scenario 'responds with correct status code ' do
    sign_up
    click_link 'New post'
    expect(page).to have_http_status(200)
  end
end
