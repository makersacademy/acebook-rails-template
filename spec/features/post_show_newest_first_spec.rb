# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts show newest first' do
    sign_up
    create_post
    click_link 'New post'
    fill_in 'Message', with: 'Testing latest post 1'
    click_button 'Submit'
    click_link('Destroy', match: :first)
    expect(page).not_to have_content('Testing latest post 1')
  end
end
