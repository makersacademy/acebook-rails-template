# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can edit their own comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Updated Comment'
    click_button 'Save'
    expect(page).to have_content('Updated Comment')
  end

end
