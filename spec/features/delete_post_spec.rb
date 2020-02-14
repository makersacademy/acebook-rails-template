# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete an existing post' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, test!'
    click_button 'Submit'
    click_link 'Delete'
    expect(page).to have_no_content('Hello, test!')
  end
end
