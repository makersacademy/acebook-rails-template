# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete own posts' do
    signing_up
    create_post
    visit '/posts'
    click_link 'Delete'
    click_button 'OK'
    expect(page).not_to have_content('Hello Robbie')
  end
end
