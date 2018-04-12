# frozen_string_literal: true

require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe 'Timeline', type: :feature do
  scenario 'User wants to edit a comment' do
    sign_up
    create_comment
    click_link 'Edit Comment'
    fill_in 'body', with: ''
    fill_in 'body', with: 'This is my world, MY WORLD!'
    click_button 'Update Comment'
    expect(page).to have_content('This is my world, MY WORLD!')
  end
end
