# frozen_string_literal: true

require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe 'Timeline', type: :feature do
  scenario 'User wants to edit a post' do
    sign_up
    create_post
    click_link 'Edit'
    fill_in 'message', with: ''
    fill_in 'message', with: 'This is my world, MY WORLD!'
    click_button 'Update Post'
    expect(page).to have_content('This is my world, MY WORLD!')
  end
end
