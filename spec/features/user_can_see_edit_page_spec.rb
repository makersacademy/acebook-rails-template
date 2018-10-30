# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit posts', type: :feature do
  scenario 'Can edit posts' do
    create_hello_world_post
    visit '/posts'
    click_link 'Edit post'
    expect(page).to have_content('Message')
  end
end
