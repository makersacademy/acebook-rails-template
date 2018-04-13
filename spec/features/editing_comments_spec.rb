# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing comments', type: :feature do
  scenario 'users can edit an existing comment' do
    sign_up
    add_new_post
    add_comment
    click_link 'Edit Comment'
    fill_in 'comment[commenter]', with: 'Charlene'
    fill_in 'comment[body]', with: 'Makers is great'
    click_button 'Update Comment'
    expect(page).to have_content 'Makers is great'
    expect(page).not_to have_content 'Rails is awesome'
  end
end
