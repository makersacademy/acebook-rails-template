# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Edit button', type: :feature do
  scenario 'Cannot edit others posts' do
    sign_up
    post_message
    click_link('Logout')
    sign_up_2
    click_link('Edit')
    expect(page).to have_content("You can't edit somebody elses post!")
    expect(current_path).to eq('/posts')
  end

  scenario 'Cannot edit 10 minutes after post creation' do
    sign_up
    post_message
    allow(Time).to receive(:now).and_return(@time_now + 11 * 60)
    click_link('Edit')
    expect(page).to have_content("You can't edit after 10 minutes!")
  end

  scenario 'Can edit own posts' do
    sign_up
    post_message
    click_link('Edit')
    fill_in('post[message]', with: 'This is edited')
    click_button('Update Post')
    expect(page).to have_content('This is edited')
    expect(current_path).to eq('/posts')
  end
end
