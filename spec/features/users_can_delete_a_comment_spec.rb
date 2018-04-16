# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'users can delete comments', type: :feature do
  scenario 'user adds comment on post, then deletes it' do
    sign_up
    add_new_post
    click_button 'Show'
    fill_in 'comment[body]', with: 'Rails is awesome'
    click_button 'Create Comment'
    click_link 'Delete Comment'
    expect(page).not_to have_content 'Rails is awesome'
  end
end
