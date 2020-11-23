# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  it 'Can edit posts and view them' do
    log_in_eman
    click_link 'New post'
    fill_in 'Message', with: 'Hello world!!'
    click_button 'New Post'
    click_link('edit_post')
    fill_in 'Message', with: "I'm updated"
    click_button 'Update Post'
    expect(page).to have_content("I'm updated")
    expect(page).not_to have_content('Hello, world!')
  end
end
