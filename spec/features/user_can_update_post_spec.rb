# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Update posts', type: :feature do
  scenario 'Can edit posts' do
    create_hello_world_post
    click_link 'Edit post'
    fill_in 'Message', with: 'I <3 Rails'
    click_button 'Update'
    expect(page).to have_content('I <3 Rails')
  end
end
